package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.*
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigDetailResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigUpdateRequest
import com.woowacourse.wordcapsule.repository.quiz.QuizConfigRepository
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
    private val userRepository: UserRepository
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
}