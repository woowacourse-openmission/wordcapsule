package com.woowacourse.wordcapsule.service.user

import com.woowacourse.wordcapsule.domain.user.UserFactory
import com.woowacourse.wordcapsule.domain.user.UserRole
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserResponse
import com.woowacourse.wordcapsule.dto.user.UserUpdateRequest
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

    @Transactional
    override fun updateUser(currentUserId: Long, request: UserUpdateRequest): UserResponse {
        val user = userRepository.findById(currentUserId)
            .orElseThrow { EntityNotFoundException("사용자를 찾을 수 없습니다. ID: $currentUserId") }

        user.updateProfile(request.password, request.username)
        return UserResponse.from(user)
    }

    @Transactional
    override fun deleteUser(currentUserId: Long, userId: Long) {
        val currentUser = userRepository.findById(currentUserId)
            .orElseThrow { EntityNotFoundException("사용자를 찾을 수 없습니다.") }

        val targetUser = userRepository.findById(userId)
            .orElseThrow { EntityNotFoundException("사용자를 찾을 수 없습니다. ID: $userId") }

        if (currentUserId != userId && currentUser.role != UserRole.ADMIN) {
            throw IllegalAccessException("본인의 정보만 삭제할 수 있습니다. 관리자는 모든 사용자를 삭제할 수 있습니다.")
        }

        userRepository.delete(targetUser)
    }
}