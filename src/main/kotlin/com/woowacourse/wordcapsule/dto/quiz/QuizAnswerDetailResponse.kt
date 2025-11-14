package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizAnswer

data class QuizAnswerDetailResponse(
    val answerId: Long,
    val quiz: QuizResponse,
    val selectedOptionId: Long,
    val questionNumber: Int,
    val isCorrect: Boolean,
) {
    companion object {
        fun from(quizAnswer: QuizAnswer): QuizAnswerDetailResponse {
            val quiz = quizAnswer.quiz

            return QuizAnswerDetailResponse(
                answerId = quizAnswer.id,
                quiz = QuizResponse.from(quiz),
                selectedOptionId = quizAnswer.option.id,
                questionNumber = quizAnswer.questionNumber,
                isCorrect = quizAnswer.isCorrect,
            )
        }
    }
}
