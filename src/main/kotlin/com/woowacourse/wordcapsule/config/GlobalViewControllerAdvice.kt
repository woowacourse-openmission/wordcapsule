package com.woowacourse.wordcapsule.config

import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import jakarta.servlet.http.HttpServletRequest
import org.springframework.http.HttpStatus
import org.springframework.http.MediaType
import org.springframework.web.servlet.NoHandlerFoundException

@ControllerAdvice
class GlobalViewControllerAdvice {

    /**
     * 특정 HTTP 상태 코드를 반환하는 예외를 처리합니다.
     * (예: EntityNotFoundException -> ResponseCode.NOT_FOUND로 매핑되는 경우)
     */
    @ExceptionHandler(Exception::class, produces = [MediaType.TEXT_HTML_VALUE])
    fun handleGeneralViewException(
        ex: Exception,
        request: HttpServletRequest
    ): String {
        val status = if (ex is IllegalAccessException) {
            HttpStatus.FORBIDDEN
        } else {
            HttpStatus.INTERNAL_SERVER_ERROR // 500
        }

        request.setAttribute("statusCode", status.value())
        request.setAttribute("errorMessage", status.reasonPhrase)
        request.setAttribute("exception", ex.message)

        return "content/error/error"
    }

    @ExceptionHandler(NoHandlerFoundException::class, produces = [MediaType.TEXT_HTML_VALUE])
    fun handleNotFoundError(
        request: HttpServletRequest
    ): String {
        request.setAttribute("statusCode", HttpStatus.NOT_FOUND.value())
        request.setAttribute("errorMessage", HttpStatus.NOT_FOUND.reasonPhrase)
        request.setAttribute("exception", "요청하신 페이지를 찾을 수 없습니다.")

        return "content/error/404"
    }
}