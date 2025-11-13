package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Quiz

// TODO: 타입 및 레벨 수정
data class QuizResponseV2(
    val quizId: Long,
    val content: String,
//    val quizType: QuizType,
    val options: List<QuizOptionResponse>,
) {
    companion object {
        fun from(quiz: Quiz): QuizResponseV2 {
            val options = quiz.options

            return QuizResponseV2(
                quizId = quiz.id,
                content = quiz.content,
//            quizType = quiz.quizType,
                options = options.map { QuizOptionResponse.from(it) },
            )
        }
    }
}
