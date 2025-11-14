package com.woowacourse.wordcapsule.domain.user

import com.woowacourse.wordcapsule.dto.user.UserCreateRequest

/**
 * User 도메인 객체 생성을 담당하는 팩토리 클래스
 * 복잡한 객체 생성 로직을 캡슐화하여 단일 책임 원칙을 준수
 */
object UserFactory {

    /**
     * 사용자 생성 요청 정보로부터 User 도메인 객체를 생성
     *
     * @param request 사용자 생성 요청 DTO
     * @return 생성된 User 도메인 객체
     */
    fun createUser(request: UserCreateRequest): User {
        return User(
            loginId = request.loginId,
            password = request.password,
            username = request.username
        )
    }
}
