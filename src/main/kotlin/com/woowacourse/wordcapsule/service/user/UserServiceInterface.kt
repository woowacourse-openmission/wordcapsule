package com.woowacourse.wordcapsule.service.user

import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserResponse

/**
 * 사용자 관리를 위한 서비스 인터페이스
 * 의존성 역전 원칙을 위해 추상화된 인터페이스 제공
 */
interface UserServiceInterface {

    /**
     * 새로운 사용자를 생성
     *
     * @param request 사용자 생성 요청 데이터
     * @return 생성된 사용자 정보
     */
    fun createUser(request: UserCreateRequest): UserResponse
}