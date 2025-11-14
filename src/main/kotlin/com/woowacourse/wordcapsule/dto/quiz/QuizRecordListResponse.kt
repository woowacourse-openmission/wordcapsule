package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizRecord
import java.time.LocalDateTime


data class QuizRecordListResponse(
    val id: Long,
    val quizName: String,
    val score: Int,
    val startedAt: LocalDateTime,
) {
    companion object {
        fun from(quizRecord: QuizRecord): QuizRecordListResponse {
            return QuizRecordListResponse(
                id = quizRecord.id,
                quizName = quizRecord.getConfigName(),
                score = quizRecord.score,
                startedAt = quizRecord.startedAt
            )
        }
    }
}
