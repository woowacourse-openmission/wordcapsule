package com.woowacourse.wordcapsule.dto.quiz

import jakarta.validation.constraints.Max
import jakarta.validation.constraints.Min
import jakarta.validation.constraints.NotNull

data class QuizRecordRequest(
    @field:NotNull(message = "생성한 유저 ID는 필수입니다")
    val userId: Long,

    @field:NotNull(message = "퀴즈 설정값 ID는 필수입니다")
    val configId: Long,

    @field:NotNull(message = "각 퀴즈엔 점수가 필요합니디")
    @field:Min(0)
    @field:Max(10)
    val score: Int,
)
