package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizOption

/**
 * 퀴즈 선택지 응답 DTO
 */
data class QuizOptionResponse(
    val optionId: Long,
    val content: String,
    val position: Int?,
    val isCorrect: Boolean
) {
    companion object {
        fun from(quizOption: QuizOption): QuizOptionResponse {
            return QuizOptionResponse(
                optionId = quizOption.id,
                content = quizOption.content,
                position = quizOption.position,
                isCorrect = quizOption.isCorrect
            )
        }
    }
}