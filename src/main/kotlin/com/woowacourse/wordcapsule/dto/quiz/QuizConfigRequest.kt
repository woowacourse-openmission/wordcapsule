package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizType
import jakarta.validation.Valid
import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.NotEmpty
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size

data class QuizConfigRequest(
    @field:NotBlank(message = "퀴즈명은 필수입니다")
    @field:Size(max = 50, message = "퀴즈명은 50자 이하여야 합니다")
    val quizName: String,

    @field:NotNull(message = "퀴즈 타입은 필수입니다")
    val quizType: QuizType,

    val level: Level = Level.BEGINNER,

    @field:NotEmpty(message = "퀴즈 문제는 최소 1개 이상 필요합니다")
    @field:Valid
    val quizzes: List<QuizRequest>
)