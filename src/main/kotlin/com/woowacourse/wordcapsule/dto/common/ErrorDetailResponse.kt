package com.woowacourse.wordcapsule.dto.common

/**
 * 에러 상세 정보를 담는 DTO
 */
data class ErrorDetailResponse(
    val field: String,
    val value: Any?,
    val reason: String
)