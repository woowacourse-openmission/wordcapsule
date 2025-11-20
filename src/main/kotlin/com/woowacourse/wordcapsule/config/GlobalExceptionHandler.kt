package com.woowacourse.wordcapsule.config

import com.woowacourse.wordcapsule.dto.common.ErrorDetailResponse
import com.woowacourse.wordcapsule.dto.common.ErrorResponse
import com.woowacourse.wordcapsule.dto.common.ResponseCode
import jakarta.persistence.EntityNotFoundException
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.http.MediaType
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
    ): ErrorResponse {
        val errors = ex.bindingResult.fieldErrors.map { fieldError ->
            ErrorDetailResponse(
                field = fieldError.field,
                value = fieldError.rejectedValue,
                reason = fieldError.defaultMessage ?: "검증 실패"
            )
        }

        return ErrorResponse.of(ResponseCode.VALIDATION_FAILED, errors)
    }

    /**
     * 엔티티를 찾을 수 없을 때 처리
     */
    @ExceptionHandler(EntityNotFoundException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleEntityNotFoundException(
        ex: EntityNotFoundException
    ): ErrorResponse {
        val errorResponse = if (ex.message.isNullOrBlank()) {
            ErrorResponse.of(ResponseCode.NOT_FOUND)
        } else {
            ErrorResponse.of(ResponseCode.NOT_FOUND, ex.message!!)
        }

        return errorResponse
    }

    /**
     * 데이터베이스 제약조건 위반 시 처리
     */
    @ExceptionHandler(DataIntegrityViolationException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleDataIntegrityViolationException(
        ex: DataIntegrityViolationException
    ): ErrorResponse {
        return ErrorResponse.of(ResponseCode.DATABASE_ERROR, ex)
    }

    /**
     * JSON 파싱 에러 처리
     */
    @ExceptionHandler(HttpMessageNotReadableException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleHttpMessageNotReadableException(): ErrorResponse {
        return ErrorResponse.of(ResponseCode.BAD_REQUEST, "잘못된 형식의 JSON 요청입니다")
    }


    /**
     * 접근 권한 없음 예외 처리
     */
    @ExceptionHandler(IllegalAccessException::class, produces = [MediaType.APPLICATION_JSON_VALUE])
    fun handleIllegalAccessException(
        ex: IllegalAccessException
    ): ErrorResponse {
        return ErrorResponse.of(ResponseCode.FORBIDDEN, ex)
    }
}