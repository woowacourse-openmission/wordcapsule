package com.woowacourse.wordcapsule.dto.user

import com.woowacourse.wordcapsule.domain.user.User
import com.woowacourse.wordcapsule.domain.user.UserRole
import java.time.LocalDateTime

/**
 * 사용자 정보 응답 DTO
 */
data class UserResponse(
    val id: Long,
    val loginId: String,
    val username: String,
    val role: UserRole,
    val createdAt: LocalDateTime,
    val updatedAt: LocalDateTime
) {
    companion object {
        fun from(user: User): UserResponse {
            return UserResponse(
                id = user.id,
                loginId = user.loginId,
                username = user.username,
                role = user.role,
                createdAt = user.createdAt,
                updatedAt = user.updatedAt
            )
        }
    }
}