package com.woowacourse.wordcapsule.service.user

import com.woowacourse.wordcapsule.domain.user.UserFactory
import com.woowacourse.wordcapsule.domain.user.UserRole
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserResponse
import com.woowacourse.wordcapsule.repository.user.UserRepository
import jakarta.persistence.EntityNotFoundException
import org.springframework.data.domain.Pageable
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

/**
 * 사용자 관리 서비스 구현체
 * 사용자의 비즈니스 로직을 처리
 */
@Service
@Transactional(readOnly = true)
class UserService(
    private val userRepository: UserRepository
) : UserServiceInterface {

    @Transactional
    override fun createUser(request: UserCreateRequest): UserResponse {
        val user = UserFactory.createUser(request)
        val savedUser = userRepository.save(user)
        return UserResponse.from(savedUser)
    }

    override fun getUsers(currentUserId: Long, pageable: Pageable): PageResponse<UserResponse> {
        val currentUser = userRepository.findById(currentUserId)
            .orElseThrow { EntityNotFoundException("사용자를 찾을 수 없습니다.") }

        if (currentUser.role != UserRole.ADMIN) {
            throw IllegalAccessException("관리자만 접근할 수 있습니다.")
        }

        val page = userRepository.findAll(pageable)
            .map(UserResponse::from)
        return PageResponse.of(page)
    }

    override fun getUserById(userId: Long): UserResponse {
        val user = userRepository.findById(userId)
            .orElseThrow { EntityNotFoundException("사용자를 찾을 수 없습니다. ID: $userId") }
        return UserResponse.from(user)
    }
}