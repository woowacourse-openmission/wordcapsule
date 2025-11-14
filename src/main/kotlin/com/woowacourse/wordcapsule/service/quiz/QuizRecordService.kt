package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizAnswer
import com.woowacourse.wordcapsule.domain.quiz.QuizRecord
import com.woowacourse.wordcapsule.domain.quiz.QuizRecordFactory
import com.woowacourse.wordcapsule.dto.quiz.QuizAnswerRequest
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest
import com.woowacourse.wordcapsule.repository.quiz.QuizConfigRepository
import com.woowacourse.wordcapsule.repository.quiz.QuizOptionRepository
import com.woowacourse.wordcapsule.repository.quiz.QuizRecordRepository
import com.woowacourse.wordcapsule.repository.quiz.QuizRepository
import jakarta.persistence.EntityNotFoundException
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
@Transactional
class QuizRecordService(
    private val quizRecordRepository: QuizRecordRepository,
    private val quizConfigRepository: QuizConfigRepository,
    private val quizOptionRepository: QuizOptionRepository,
    private val quizRepository: QuizRepository
): QuizRecordServiceInterface {

    /**
     * 퀴즈 기록 생성
     */
    @Transactional
    override fun createQuizRecord(request: QuizRecordRequest): Long {
        // TODO : 유저 연관관계 매핑
//        val user = userRepository...
        val configId = request.configId
        val quizConfig = quizConfigRepository.findById(configId)
            .orElseThrow { EntityNotFoundException("퀴즈 설정을 찾을 수 없습니다. ID: $configId") }

        val quizRecord = QuizRecordFactory.createQuizRecord(request, quizConfig)

        val savedQuizRecord = quizRecordRepository.save(quizRecord)

        val answers = request.answers.map { answerDto -> buildQuizAnswer(answerDto, savedQuizRecord) }

        answers.forEach { answer -> savedQuizRecord.addAnswer(answer) }

        return savedQuizRecord.id
    }

    fun buildQuizAnswer(request: QuizAnswerRequest, savedQuizRecord: QuizRecord): QuizAnswer {
        return QuizAnswer(
            record = savedQuizRecord,

            quiz = quizRepository.findById(request.quizId)
                .orElseThrow { EntityNotFoundException("퀴즈를 찾을 수 없습니다. ID: ${request.quizId}") },

            option = quizOptionRepository.findById(request.optionId)
                .orElseThrow { EntityNotFoundException("선택지를 찾을 수 없습니다. ID: ${request.optionId}") },

            questionNumber = request.questionNumber,

            isCorrect = request.isCorrect
        )
    }
}