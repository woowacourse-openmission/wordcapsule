package com.woowacourse.wordcapsule.dto.common

/**
 * 데이터 없이 성공 상태만 응답하는 DTO (주로 204 No Content용)
 */
class SimpleResponse private constructor(
    code: String,
    message: String
) : BaseResponse(code, message) {

    companion object {
        /**
         * No Content 응답 생성 (204 No Content)
         * 
         * @return No Content 응답 객체
         */
        fun noContent(): SimpleResponse {
            return SimpleResponse(
                code = ResponseCode.NO_CONTENT.code,
                message = ResponseCode.NO_CONTENT.message
            )
        }

        /**
         * Accepted 응답 생성 (202 Accepted)
         * 
         * @return Accepted 응답 객체
         */
        fun accepted(): SimpleResponse {
            return SimpleResponse(
                code = ResponseCode.ACCEPTED.code,
                message = ResponseCode.ACCEPTED.message
            )
        }

        /**
         * 사용자 정의 메시지와 함께 No Content 응답 생성
         * 
         * @param message 사용자 정의 메시지
         * @return No Content 응답 객체
         */
        fun noContent(message: String): SimpleResponse {
            return SimpleResponse(
                code = ResponseCode.NO_CONTENT.code,
                message = message
            )
        }

        /**
         * 사용자 정의 메시지와 함께 Accepted 응답 생성
         * 
         * @param message 사용자 정의 메시지
         * @return Accepted 응답 객체
         */
        fun accepted(message: String): SimpleResponse {
            return SimpleResponse(
                code = ResponseCode.ACCEPTED.code,
                message = message
            )
        }
    }
}