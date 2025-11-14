package com.woowacourse.wordcapsule.dto.user

import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.Size

/**
 * 사용자 생성 요청 DTO
 */
data class UserCreateRequest(
    @field:NotBlank(message = "로그인 아이디는 필수입니다")
    @field:Size(min = 5, max = 20, message = "아이디는 5자 이상 20자 이하로 입력해야 합니다")
    val loginId: String,

    @field:NotBlank(message = "비밀번호는 필수입니다")
    @field:Size(min = 8, max = 20, message = "비밀번호는 8자 이상 20자 이하로 입력해야 합니다")
    val password: String,

    @field:NotBlank(message = "사용자 이름은 필수입니다")
    @field:Size(min = 1, max = 50, message = "사용자 이름은 1자 이상 50자 이하로 입력해야 합니다")
    val username: String
)