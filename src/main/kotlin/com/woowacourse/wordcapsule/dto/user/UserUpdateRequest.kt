package com.woowacourse.wordcapsule.dto.user

import jakarta.validation.constraints.Size

/**
 * 사용자 정보 수정 요청 DTO
 */
data class UserUpdateRequest(
    @field:Size(min = 8, max = 20, message = "비밀번호는 8자 이상 20자 이하로 입력해야 합니다")
    val password: String?,

    @field:Size(min = 1, max = 50, message = "사용자 이름은 1자 이상 50자 이하로 입력해야 합니다")
    val username: String?
)