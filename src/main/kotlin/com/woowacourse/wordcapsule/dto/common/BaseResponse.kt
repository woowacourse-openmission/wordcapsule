package com.woowacourse.wordcapsule.dto.common

/**
 * API 응답의 기본 구조를 정의하는 추상 클래스
 */
abstract class BaseResponse(
    val code: String,
    val message: String
)