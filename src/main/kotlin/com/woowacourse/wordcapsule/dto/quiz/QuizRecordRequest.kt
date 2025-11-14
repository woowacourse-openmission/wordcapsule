package com.woowacourse.wordcapsule.dto.quiz

import jakarta.validation.Valid
import jakarta.validation.constraints.Max
import jakarta.validation.constraints.Min
import jakarta.validation.constraints.NotEmpty
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size

/**
 * 시간은 아래와 같은 형식으로 전달
 * - ISO 형식 문자열 ("2025-11-11T20:30:00")
 */
data class QuizRecordRequest(
    @field:NotNull(message = "생성한 유저 ID는 필수입니다")
    val userId: Long,

    @field:NotNull(message = "퀴즈 설정값 ID는 필수입니다")
    val configId: Long,

    @field:NotNull(message = "각 퀴즈엔 점수가 필요합니다")
    @field:Min(0)
    @field:Max(10)
    val score: Int,

    @field:NotNull(message = "시작 시간은 필수입니다")
    val startedAt: String,

    @field:NotNull(message = "완료 시간은 필수입니다")
    val completedAt: String,

    @field:NotEmpty(message = "퀴즈 기록엔 각각의 답변이 필요합니다")
    @field:Size(min = 10, max = 10, message = "퀴즈에 대한 답변은 10개여야 합니다")
    @field:Valid
    val answers: List<QuizAnswerRequest>
)
