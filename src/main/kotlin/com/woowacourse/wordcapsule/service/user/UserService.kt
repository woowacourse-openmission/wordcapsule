package com.woowacourse.wordcapsule.service.user

import com.woowacourse.wordcapsule.domain.user.User
import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserResponse
import com.woowacourse.wordcapsule.repository.user.UserRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

/**
 * 사용자 관리를 위한 서비스
 */
@Service
@Transactional(readOnly = true)
class UserService(
    private val userRepository: UserRepository
) {

    /**
     * 새로운 사용자를 생성
     *
     * @param request 사용자 생성 요청 데이터
     * @return 생성된 사용자 정보
     */
    @Transactional
    fun createUser(request: UserCreateRequest): UserResponse {
        val user = User(
            loginId = request.loginId,
            password = request.password,
            username = request.username
        )
        val savedUser = userRepository.save(user)
        return UserResponse.from(savedUser)
    }
}