package com.woowacourse.wordcapsule.dto.quiz

import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size

data class QuizOptionRequest(
    @field:NotBlank(message = "선택지 내용은 필수입니다")
    @field:Size(max = 50, message = "선택지 내용은 50자 이하여야 합니다")
    val content: String,

    val position: Int? = null,

    @field:NotNull(message = "정답 여부는 필수입니다")
    val isCorrect: Boolean
)