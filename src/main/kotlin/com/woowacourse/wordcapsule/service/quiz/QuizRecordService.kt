package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizRecordFactory
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest
import com.woowacourse.wordcapsule.repository.quiz.QuizConfigRepository
import com.woowacourse.wordcapsule.repository.quiz.QuizRecordRepository
import jakarta.persistence.EntityNotFoundException
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
@Transactional(readOnly = true)
class QuizRecordService(
    private val quizRecordRepository: QuizRecordRepository,
    private val quizConfigRepository: QuizConfigRepository,
): QuizRecordServiceInterface {

    /**
     * 퀴즈 기록 생성
     */
    override fun createQuizRecord(request: QuizRecordRequest): Long {
        // TODO : 유저 연관관계 매핑
//        val user = userRepository...
        val configId = request.configId
        val quizConfig = quizConfigRepository.findById(configId)
            .orElseThrow { EntityNotFoundException("퀴즈 설정을 찾을 수 없습니다. ID: $configId") }

        val quizRecord = QuizRecordFactory.createQuizRecord(request, quizConfig)
        val savedQuizRecord = quizRecordRepository.save(quizRecord)
        return savedQuizRecord.id
    }
}