package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizConfig
import java.time.LocalDateTime

/**
 * 퀴즈 설정 상세조회 응답 DTO
 */
data class QuizConfigDetailResponse(
    val configId: Long,
    val quizName: String,
    val level: Level,
    val createdAt: LocalDateTime,
    val updatedAt: LocalDateTime,
    val quizzes: List<QuizResponse>
) {
    companion object {
        fun from(quizConfig: QuizConfig): QuizConfigDetailResponse {
            return QuizConfigDetailResponse(
                configId = quizConfig.id,
                quizName = quizConfig.quizName,
                level = quizConfig.level,
                createdAt = quizConfig.createdAt,
                updatedAt = quizConfig.updatedAt,
                quizzes = quizConfig.quizzes.map { QuizResponse.from(it) }
            )
        }
    }
}