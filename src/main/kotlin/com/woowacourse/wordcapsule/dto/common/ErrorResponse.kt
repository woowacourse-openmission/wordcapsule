package com.woowacourse.wordcapsule.dto.common

/**
 * 에러 응답을 위한 DTO
 */
class ErrorResponse private constructor(
    code: String,
    message: String,
    val errors: List<ErrorDetailResponse> = emptyList()
) : BaseResponse(code, message) {

    companion object {
        /**
         * 단순 에러 응답 생성
         *
         * @param responseCode 응답 코드
         * @return 에러 응답 객체
         */
        fun of(responseCode: ResponseCode): ErrorResponse {
            return ErrorResponse(
                code = responseCode.code,
                message = responseCode.message
            )
        }

        /**
         * 예외와 함께 에러 응답 생성
         *
         * @param responseCode 응답 코드
         * @param throwable 발생한 예외
         * @return 에러 응답 객체
         */
        fun of(responseCode: ResponseCode, throwable: Throwable): ErrorResponse {
            return ErrorResponse(
                code = responseCode.code,
                message = responseCode.getMessage(throwable)
            )
        }

        /**
         * 사용자 정의 메시지와 함께 에러 응답 생성
         *
         * @param responseCode 응답 코드
         * @param message 사용자 정의 메시지
         * @return 에러 응답 객체
         */
        fun of(responseCode: ResponseCode, message: String): ErrorResponse {
            return ErrorResponse(
                code = responseCode.code,
                message = message
            )
        }

        /**
         * 상세 에러 정보와 함께 에러 응답 생성
         *
         * @param responseCode 응답 코드
         * @param errors 상세 에러 정보 리스트
         * @return 에러 응답 객체
         */
        fun of(responseCode: ResponseCode, errors: List<ErrorDetailResponse>): ErrorResponse {
            return ErrorResponse(
                code = responseCode.code,
                message = responseCode.message,
                errors = errors
            )
        }

        /**
         * 상세 에러 정보와 사용자 정의 메시지와 함께 에러 응답 생성
         *
         * @param responseCode 응답 코드
         * @param message 사용자 정의 메시지
         * @param errors 상세 에러 정보 리스트
         * @return 에러 응답 객체
         */
        fun of(responseCode: ResponseCode, message: String, errors: List<ErrorDetailResponse>): ErrorResponse {
            return ErrorResponse(
                code = responseCode.code,
                message = message,
                errors = errors
            )
        }
    }
}