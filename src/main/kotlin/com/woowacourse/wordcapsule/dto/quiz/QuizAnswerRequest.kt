package com.woowacourse.wordcapsule.dto.quiz

import jakarta.validation.constraints.Positive
import jakarta.validation.constraints.PositiveOrZero

data class QuizAnswerRequest(
    @field:Positive(message = "퀴즈 ID는 1 이상이어야 합니다")
    val quizId: Long,

    @field:Positive(message = "선택지 ID는 1 이상이어야 합니다")
    val optionId: Long,

    val isCorrect: Boolean
)