package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizConfig
import java.time.LocalDateTime

/**
 * 퀴즈 설정 목록 조회 응답 DTO
 */
data class QuizConfigListResponse(
    val configId: Long,
    val quizName: String,
    val level: Level,
    val quizCount: Int,
    val createdAt: LocalDateTime
) {
    companion object {
        fun from(quizConfig: QuizConfig): QuizConfigListResponse {
            return QuizConfigListResponse(
                configId = quizConfig.id,
                quizName = quizConfig.quizName,
                level = quizConfig.level,
                quizCount = quizConfig.quizzes.size,
                createdAt = quizConfig.createdAt
            )
        }
    }
}