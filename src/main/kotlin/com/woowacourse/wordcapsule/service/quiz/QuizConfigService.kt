package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizConfigFactory
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import com.woowacourse.wordcapsule.repository.quiz.QuizConfigRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

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
        val quizConfig = QuizConfigFactory.createQuizConfig(request)
        val savedConfig = quizConfigRepository.save(quizConfig)
        return savedConfig.id
    }
}