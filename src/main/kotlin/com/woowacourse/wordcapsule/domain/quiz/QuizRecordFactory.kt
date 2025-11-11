package com.woowacourse.wordcapsule.domain.quiz

import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest

object QuizRecordFactory {
    fun createQuizRecord(request: QuizRecordRequest, quizConfig: QuizConfig): QuizRecord {
        val quizRecord = QuizRecord(
            userId = request.userId,
            config = quizConfig,
            score = request.score
        )

        return quizRecord
    }
}