package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizConfigFactory
import com.woowacourse.wordcapsule.domain.quiz.QuizType
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import com.woowacourse.wordcapsule.repository.quiz.QuizConfigRepository
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageImpl
import org.springframework.data.domain.Pageable
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
    
    override fun getQuizConfigs(level: Level?, quizType: QuizType?, pageable: Pageable): PageResponse<QuizConfigListResponse> {
        val page = when {
            level != null && quizType != null -> quizConfigRepository.findByLevelAndQuizType(level, quizType, pageable)
            level != null -> quizConfigRepository.findByLevel(level, pageable)
            quizType != null -> quizConfigRepository.findByQuizType(quizType, pageable)
            else -> quizConfigRepository.findAll(pageable)
        }
        
        val responseList = page.content.map { QuizConfigListResponse.from(it) }
        val responsePage = PageImpl(responseList, page.pageable, page.totalElements)
        
        return PageResponse.of(responsePage)
    }
}