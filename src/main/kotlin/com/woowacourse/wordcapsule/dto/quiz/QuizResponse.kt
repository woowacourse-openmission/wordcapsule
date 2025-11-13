package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizType
import com.woowacourse.wordcapsule.domain.quiz.Quiz

/**
 * 퀴즈 응답 DTO
 */
data class QuizResponse(
    val quizId: Long,
    val content: String,
    val quizType: QuizType,
    val options: List<QuizOptionResponse>
) {
    companion object {
        fun from(quiz: Quiz): QuizResponse {
            return QuizResponse(
                quizId = quiz.id,
                content = quiz.content,
                quizType = quiz.quizType,
                options = quiz.options.map { QuizOptionResponse.from(it) }
            )
        }
    }
}