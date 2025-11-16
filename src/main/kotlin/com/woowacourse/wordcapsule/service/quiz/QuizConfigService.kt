package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.*
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigDetailResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigUpdateRequest
import com.woowacourse.wordcapsule.dto.quiz.RandomQuizResponse
import com.woowacourse.wordcapsule.repository.quiz.QuizConfigRepository
import com.woowacourse.wordcapsule.repository.quiz.QuizRecordRepository
import com.woowacourse.wordcapsule.repository.user.UserRepository
import org.springframework.data.domain.Pageable
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import jakarta.persistence.EntityNotFoundException

/**
 * 퀴즈 설정 관리 서비스 구현체
 * 퀴즈 설정의 비즈니스 로직을 처리
 */
@Service
@Transactional(readOnly = true)
class QuizConfigService(
    private val quizConfigRepository: QuizConfigRepository,
    private val userRepository: UserRepository,
    private val quizRecordRepository: QuizRecordRepository
) : QuizConfigServiceInterface {

    @Transactional
    override fun createQuizConfig(request: QuizConfigRequest): Long {
        val user = userRepository.findById(request.userId)
            .orElseThrow { EntityNotFoundException("사용자를 찾을 수 없습니다. ID: ${request.userId}") }
        
        val quizConfig = QuizConfigFactory.createQuizConfig(request, user)
        val savedConfig = quizConfigRepository.save(quizConfig)
        return savedConfig.id
    }

    override fun getQuizConfigs(
        level: Level?,
        quizType: QuizType?,
        pageable: Pageable
    ): PageResponse<QuizConfigListResponse> {
        val page = when {
            level != null && quizType != null -> quizConfigRepository.findByLevelAndQuizType(level, quizType, pageable)
            level != null -> quizConfigRepository.findByLevel(level, pageable)
            quizType != null -> quizConfigRepository.findByQuizType(quizType, pageable)
            else -> quizConfigRepository.findAll(pageable)
        }.map(QuizConfigListResponse::from)

        return PageResponse.of(page)
    }
    
    override fun getQuizConfigDetail(configId: Long): QuizConfigDetailResponse {
        val quizConfig = quizConfigRepository.findById(configId)
            .orElseThrow { EntityNotFoundException("퀴즈 설정을 찾을 수 없습니다. ID: $configId") }
        
        return QuizConfigDetailResponse.from(quizConfig)
    }
    
    @Transactional
    override fun updateQuizConfig(configId: Long, request: QuizConfigUpdateRequest): Long {
        val quizConfig = quizConfigRepository.findById(configId)
            .orElseThrow { EntityNotFoundException("퀴즈 설정을 찾을 수 없습니다. ID: $configId") }
        
        // JPA dirty checking 활용 - 엔티티 직접 수정
        request.quizName?.let { quizConfig.quizName = it }
        request.level?.let { quizConfig.level = it }
        
        // save() 호출 없이도 트랜잭션 종료 시 자동 업데이트
        return quizConfig.id
    }
    
    @Transactional
    override fun deleteQuizConfig(configId: Long) {
        val quizConfig = quizConfigRepository.findById(configId)
            .orElseThrow { EntityNotFoundException("퀴즈 설정을 찾을 수 없습니다. ID: $configId") }
        
        quizConfigRepository.delete(quizConfig)
    }

    override fun getRandomQuizRecommendation(userId: Long): RandomQuizResponse {
        // 1. 사용자 조회
        val user = userRepository.findById(userId)
            .orElse(null) ?: return RandomQuizResponse.userNotFound()

        // 2. 사용자의 레벨에 맞는 퀴즈 목록 조회
        val userLevel = user.level
        val availableQuizzes = quizConfigRepository.findByLevel(userLevel)

        // 3. 사용자가 이미 푼 퀴즈 기록 조회
        val completedRecords = quizRecordRepository.findAllByUserId(userId)
        val completedConfigIds = completedRecords.map { it.config.id }.toSet()

        // 4. 아직 풀지 않은 퀴즈 필터링
        val uncompletedQuizzes = availableQuizzes.filter { it.id !in completedConfigIds }

        // 5. 결과 반환
        return if (uncompletedQuizzes.isEmpty()) {
            // 모든 퀴즈를 완료한 경우
            RandomQuizResponse.completed(userLevel)
        } else {
            // 랜덤으로 하나 선택
            val randomQuiz = uncompletedQuizzes.random()
            val quizDetail = QuizConfigDetailResponse.from(randomQuiz)
            RandomQuizResponse.success(quizDetail, userLevel)
        }
    }
}