package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizType
import jakarta.validation.constraints.NotNull
import jakarta.validation.Valid
import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.NotEmpty
import jakarta.validation.constraints.Size

data class QuizRequest(
    @field:NotBlank(message = "퀴즈 내용은 필수입니다")
    @field:Size(max = 100, message = "퀴즈 내용은 100자 이하여야 합니다")
    val content: String,

    @field:NotNull(message = "퀴즈 타입은 필수입니다")
    val quizType: QuizType,

    @field:NotEmpty(message = "선택지는 최소 1개 이상 필요합니다")
    @field:Valid
    val options: List<QuizOptionRequest>
)