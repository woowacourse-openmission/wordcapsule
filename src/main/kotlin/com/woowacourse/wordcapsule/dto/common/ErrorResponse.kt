package com.woowacourse.wordcapsule.dto.common

import java.time.LocalDateTime

/**
 * API 에러 응답을 위한 공통 DTO
 */
data class ErrorResponse(
    val timestamp: LocalDateTime = LocalDateTime.now(),
    val status: Int,
    val error: String,
    val message: String,
    val path: String,
    val details: List<String> = emptyList()
)