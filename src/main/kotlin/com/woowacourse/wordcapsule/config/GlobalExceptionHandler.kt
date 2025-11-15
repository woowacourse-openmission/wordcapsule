package com.woowacourse.wordcapsule.config

import com.woowacourse.wordcapsule.dto.common.ErrorDetailResponse
import com.woowacourse.wordcapsule.dto.common.ErrorResponse
import com.woowacourse.wordcapsule.dto.common.ResponseCode
import jakarta.persistence.EntityNotFoundException
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.http.MediaType
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
    @ExceptionHandler(MethodArgumentNotValidException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleValidationException(
        ex: MethodArgumentNotValidException
    ): ResponseEntity<ErrorResponse> {
        val errors = ex.bindingResult.fieldErrors.map { fieldError ->
            ErrorDetailResponse(
                field = fieldError.field,
                value = fieldError.rejectedValue,
                reason = fieldError.defaultMessage ?: "검증 실패"
            )
        }

        val errorResponse = ErrorResponse.of(ResponseCode.VALIDATION_FAILED, errors)
        return ResponseEntity.status(ResponseCode.VALIDATION_FAILED.httpStatus).body(errorResponse)
    }

    /**
     * 엔티티를 찾을 수 없을 때 처리
     */
    @ExceptionHandler(EntityNotFoundException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleEntityNotFoundException(
        ex: EntityNotFoundException
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = if (ex.message.isNullOrBlank()) {
            ErrorResponse.of(ResponseCode.NOT_FOUND)
        } else {
            ErrorResponse.of(ResponseCode.NOT_FOUND, ex.message!!)
        }

        return ResponseEntity.status(ResponseCode.NOT_FOUND.httpStatus).body(errorResponse)
    }

    /**
     * 데이터베이스 제약조건 위반 시 처리
     */
    @ExceptionHandler(DataIntegrityViolationException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleDataIntegrityViolationException(
        ex: DataIntegrityViolationException
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse.of(ResponseCode.DATABASE_ERROR, ex)
        return ResponseEntity.status(ResponseCode.DATABASE_ERROR.httpStatus).body(errorResponse)
    }

    /**
     * JSON 파싱 에러 처리
     */
    @ExceptionHandler(HttpMessageNotReadableException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleHttpMessageNotReadableException(
        ex: HttpMessageNotReadableException
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse.of(ResponseCode.BAD_REQUEST, "잘못된 형식의 JSON 요청입니다")
        return ResponseEntity.status(ResponseCode.BAD_REQUEST.httpStatus).body(errorResponse)
    }

//    /**
//     * 기타 모든 예외에 대한 기본 처리
//     */
//    @ExceptionHandler(Exception::class, produces = [MediaType.APPLICATION_JSON_VALUE])
//    fun handleGenericException(
//        ex: Exception
//    ): ResponseEntity<ErrorResponse> {
//        val errorResponse = ErrorResponse.of(ResponseCode.INTERNAL_ERROR, ex)
//        return ResponseEntity.status(ResponseCode.INTERNAL_ERROR.httpStatus).body(errorResponse)
//    }

    /**
     * 접근 권한 없음 예외 처리
     */
    @ExceptionHandler(IllegalAccessException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleIllegalAccessException(
        ex: IllegalAccessException
    ): ResponseEntity<ErrorResponse> {
        val errorResponse = ErrorResponse.of(ResponseCode.FORBIDDEN, ex)
        return ResponseEntity.status(ResponseCode.FORBIDDEN.httpStatus).body(errorResponse)
    }
}