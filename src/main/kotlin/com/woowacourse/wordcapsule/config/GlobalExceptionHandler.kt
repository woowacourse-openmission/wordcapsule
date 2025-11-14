package com.woowacourse.wordcapsule.config

import com.woowacourse.wordcapsule.dto.common.ErrorResponse
import jakarta.persistence.EntityNotFoundException
import jakarta.servlet.http.HttpServletRequest
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.http.converter.HttpMessageNotReadableException
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RestControllerAdvice

/**
 * 전역 예외 처리를 위한 컨트롤러 어드바이스
 * 모든 컨트롤러에서 발생하는 예외를 일관된 형태로 처리
 */
@RestControllerAdvice
class GlobalExceptionHandler {

    /**
     * 요청 데이터 검증 실패 시 처리
     * @Valid 어노테이션으로 인한 검증 오류를 처리
     */
    @ExceptionHandler(MethodArgumentNotValidException::class)
    fun handleValidationException(
        ex: MethodArgumentNotValidException,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {
        val details = ex.bindingResult.fieldErrors.map { fieldError ->
            "${fieldError.field}: ${fieldError.defaultMessage}"
        }

        val errorResponse = ErrorResponse(
            status = HttpStatus.BAD_REQUEST.value(),
            error = "Validation Failed",
            message = "요청 데이터 검증에 실패했습니다.",
            path = request.requestURI,
            details = details
        )

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorResponse)
    }

    /**
     * 엔티티를 찾을 수 없을 때 처리
     */
    @ExceptionHandler(EntityNotFoundException::class)
    fun handleEntityNotFoundException(
        ex: EntityNotFoundException,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse(
            status = HttpStatus.NOT_FOUND.value(),
            error = "Entity Not Found",
            message = ex.message ?: "요청한 리소스를 찾을 수 없습니다.",
            path = request.requestURI
        )

        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorResponse)
    }

    /**
     * 데이터베이스 제약조건 위반 시 처리
     */
    @ExceptionHandler(DataIntegrityViolationException::class)
    fun handleDataIntegrityViolationException(
        ex: DataIntegrityViolationException,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse(
            status = HttpStatus.CONFLICT.value(),
            error = "Data Integrity Violation",
            message = "데이터 무결성 제약조건을 위반했습니다.",
            path = request.requestURI
        )

        return ResponseEntity.status(HttpStatus.CONFLICT).body(errorResponse)
    }

    /**
     * JSON 파싱 에러 처리
     */
    @ExceptionHandler(HttpMessageNotReadableException::class)
    fun handleHttpMessageNotReadableException(
        ex: HttpMessageNotReadableException,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse(
            status = HttpStatus.BAD_REQUEST.value(),
            error = "Malformed JSON",
            message = "잘못된 형식의 JSON 요청입니다.",
            path = request.requestURI
        )

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorResponse)
    }

    /**
     * 접근 권한 없음 예외 처리
     */
    @ExceptionHandler(IllegalAccessException::class)
    fun handleIllegalAccessException(
        ex: IllegalAccessException
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse.of(ResponseCode.FORBIDDEN,ex)
        return ResponseEntity.status(ResponseCode.FORBIDDEN.httpStatus).body(errorResponse)
    }

    /**
     * 접근 권한 없음 예외 처리
     */
    @ExceptionHandler(IllegalAccessException::class)
    fun handleIllegalAccessException(
        ex: IllegalAccessException
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse.of(ResponseCode.FORBIDDEN,ex)
        return ResponseEntity.status(ResponseCode.FORBIDDEN.httpStatus).body(errorResponse)
    }

    /**
     * 기타 모든 예외에 대한 기본 처리
     */
    @ExceptionHandler(Exception::class)
    fun handleGenericException(
        ex: Exception,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse(
            status = HttpStatus.INTERNAL_SERVER_ERROR.value(),
            error = "Internal Server Error",
            message = "서버 내부 오류가 발생했습니다.",
            path = request.requestURI
        )

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse)
    }
}