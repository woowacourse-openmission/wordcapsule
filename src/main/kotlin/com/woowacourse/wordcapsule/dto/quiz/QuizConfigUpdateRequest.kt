package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import jakarta.validation.constraints.Size

/**
 * 퀴즈 설정 수정 요청 DTO
 * PATCH 요청에서 선택적 필드 업데이트를 지원
 */
data class QuizConfigUpdateRequest(
    @field:Size(min = 1, max = 50, message = "퀴즈 이름은 1자 이상 50자 이하여야 합니다")
    val quizName: String? = null,

    val level: Level? = null
)