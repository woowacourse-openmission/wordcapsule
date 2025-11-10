package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.Quiz

/**
 * 퀴즈 응답 DTO
 */
data class QuizResponse(
    val quizId: Long,
    val content: String,
    val level: Level,
    val options: List<QuizOptionResponse>
) {
    companion object {
        fun from(quiz: Quiz): QuizResponse {
            return QuizResponse(
                quizId = quiz.id,
                content = quiz.content,
                level = quiz.level,
                options = quiz.options.map { QuizOptionResponse.from(it) }
            )
        }
    }
}