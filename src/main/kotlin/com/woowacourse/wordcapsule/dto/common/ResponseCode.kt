package com.woowacourse.wordcapsule.dto.common

import org.springframework.http.HttpStatus

/**
 * API 응답 코드를 정의하는 열거형
 */
enum class ResponseCode(
    val code: String,
    val httpStatus: HttpStatus,
    val message: String
) {
    // Success
    OK("S000", HttpStatus.OK, "OK"),
    CREATED("S001", HttpStatus.CREATED, "생성되었습니다"),
    ACCEPTED("S002", HttpStatus.ACCEPTED, "요청이 접수되었습니다"),
    NO_CONTENT("S003", HttpStatus.NO_CONTENT, "처리되었습니다"),
    
    // Client Error
    BAD_REQUEST("C000", HttpStatus.BAD_REQUEST, "잘못된 요청입니다"),
    VALIDATION_FAILED("C001", HttpStatus.BAD_REQUEST, "요청 데이터 검증에 실패했습니다"),
    NOT_FOUND("C002", HttpStatus.NOT_FOUND, "요청한 리소스를 찾을 수 없습니다"),
    METHOD_NOT_ALLOWED("C003", HttpStatus.METHOD_NOT_ALLOWED, "지원하지 않는 HTTP Method입니다"),
    FORBIDDEN("C004", HttpStatus.FORBIDDEN, "접근 권한이 없습니다"),
    
    // Server Error
    INTERNAL_ERROR("S500", HttpStatus.INTERNAL_SERVER_ERROR, "서버 내부 오류가 발생했습니다"),
    DATABASE_ERROR("S501", HttpStatus.INTERNAL_SERVER_ERROR, "데이터베이스 오류가 발생했습니다");
    
    /**
     * 예외 메시지와 함께 응답 메시지를 반환
     */
    fun getMessage(throwable: Throwable?): String {
        return if (throwable?.message.isNullOrBlank()) {
            this.message
        } else {
            "${this.message} - ${throwable?.message}"
        }
    }
    
    /**
     * 사용자 정의 메시지와 함께 응답 메시지를 반환
     */
    fun getMessage(customMessage: String?): String {
        return if (customMessage.isNullOrBlank()) {
            this.message
        } else {
            customMessage
        }
    }
}