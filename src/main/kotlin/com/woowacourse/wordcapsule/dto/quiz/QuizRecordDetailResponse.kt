package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizRecord
import java.time.LocalDateTime

data class QuizRecordDetailResponse(
    val id: Long,
    val userId: Long,
    val score: Int,
    val startedAt: LocalDateTime,
    val completedAt: LocalDateTime,

    val configId: Long,
    val quizName: String,
    val level: Level,

    val answers: List<QuizAnswerDetailResponse>
) {
    companion object {
        fun from(quizRecord: QuizRecord): QuizRecordDetailResponse {
            val config = quizRecord.config
            val answers = quizRecord.answers

            return QuizRecordDetailResponse(
                id = quizRecord.id,
                userId = quizRecord.userId,
                score = quizRecord.score,
                startedAt = quizRecord.startedAt,
                completedAt = quizRecord.completedAt,

                configId = config.id,
                quizName = config.quizName,
                level = config.level,

                answers = answers.map { QuizAnswerDetailResponse.from(it) }
            )
        }
    }
}