package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import jakarta.validation.Valid
import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.NotEmpty
import jakarta.validation.constraints.Size

data class QuizRequest(
    @field:NotBlank(message = "퀴즈 내용은 필수입니다")
    @field:Size(max = 50, message = "퀴즈 내용은 50자 이하여야 합니다")
    val content: String,

    val level: Level = Level.BEGINNER,

    @field:NotEmpty(message = "선택지는 최소 1개 이상 필요합니다")
    @field:Valid
    val options: List<QuizOptionRequest>
)