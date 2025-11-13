package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.*
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigDetailResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import com.woowacourse.wordcapsule.repository.quiz.QuizConfigRepository
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
    private val quizConfigRepository: QuizConfigRepository
) : QuizConfigServiceInterface {

    @Transactional
    override fun createQuizConfig(request: QuizConfigRequest): Long {
        val quizConfig = QuizConfig(
            quizName = request.quizName,
            level = request.level
        )
        
        val quizzes = request.quizzes.map { quizRequest ->
            val quiz = Quiz(
                config = quizConfig,
                content = quizRequest.content,
                quizType = quizRequest.quizType
            )
            
            val options = quizRequest.options.map { optionRequest ->
                QuizOption(
                    quiz = quiz,
                    content = optionRequest.content,
                    position = optionRequest.position,
                    isCorrect = optionRequest.isCorrect
                )
            }
            
            // Quiz의 options 설정
            Quiz(
                config = quizConfig,
                content = quiz.content,
                quizType = quiz.quizType,
                options = options
            )
        }
        
        // QuizConfig의 quizzes 설정
        val finalConfig = QuizConfig(
            quizName = request.quizName,
            level = request.level,
            quizzes = quizzes
        )
        
        val savedConfig = quizConfigRepository.save(finalConfig)
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
}