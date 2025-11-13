package com.woowacourse.wordcapsule.dto.common

/**
 * 성공 응답을 위한 DTO
 * 
 * @param T 응답 데이터의 타입
 */
class DataResponse<T> private constructor(
    code: String,
    message: String,
    val data: T
) : BaseResponse(code, message) {
    
    companion object {
        /**
         * 성공 응답 생성 (200 OK)
         * 
         * @param data 응답할 데이터
         * @return 성공 응답 객체
         */
        fun <T> of(data: T): DataResponse<T> {
            return DataResponse(
                code = ResponseCode.OK.code,
                message = ResponseCode.OK.message,
                data = data
            )
        }
        
        /**
         * 리소스 생성 응답 (201 Created)
         * 
         * @param data 생성된 리소스 데이터
         * @return 생성 응답 객체
         */
        fun <T> created(data: T): DataResponse<T> {
            return DataResponse(
                code = ResponseCode.CREATED.code,
                message = ResponseCode.CREATED.message,
                data = data
            )
        }
        
        /**
         * 요청 접수 응답 (202 Accepted)
         * 
         * @param data 응답할 데이터
         * @return 접수 응답 객체
         */
        fun <T> accepted(data: T): DataResponse<T> {
            return DataResponse(
                code = ResponseCode.ACCEPTED.code,
                message = ResponseCode.ACCEPTED.message,
                data = data
            )
        }
        
        /**
         * 사용자 정의 메시지와 함께 성공 응답 생성 (200 OK)
         * 
         * @param data 응답할 데이터
         * @param message 사용자 정의 메시지
         * @return 성공 응답 객체
         */
        fun <T> of(data: T, message: String): DataResponse<T> {
            return DataResponse(
                code = ResponseCode.OK.code,
                message = message,
                data = data
            )
        }
        
        /**
         * 사용자 정의 메시지와 함께 생성 응답 생성 (201 Created)
         * 
         * @param data 생성된 리소스 데이터
         * @param message 사용자 정의 메시지
         * @return 생성 응답 객체
         */
        fun <T> created(data: T, message: String): DataResponse<T> {
            return DataResponse(
                code = ResponseCode.CREATED.code,
                message = message,
                data = data
            )
        }
        
        /**
         * 사용자 정의 메시지와 함께 접수 응답 생성 (202 Accepted)
         * 
         * @param data 응답할 데이터
         * @param message 사용자 정의 메시지
         * @return 접수 응답 객체
         */
        fun <T> accepted(data: T, message: String): DataResponse<T> {
            return DataResponse(
                code = ResponseCode.ACCEPTED.code,
                message = message,
                data = data
            )
        }
    }
}