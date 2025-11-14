package com.woowacourse.wordcapsule.controller.user

import com.woowacourse.wordcapsule.dto.common.DataResponse
import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserResponse
import com.woowacourse.wordcapsule.service.user.UserServiceInterface
import jakarta.validation.Valid
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*

/**
 * 사용자 관리를 위한 REST API 컨트롤러
 */
@RestController
@RequestMapping("/users")
class UserController(
    private val userService: UserServiceInterface
) {

    /**
     * 새로운 사용자를 생성
     *
     * @param request 사용자 생성 요청 데이터
     * @return HTTP 201 Created와 생성된 사용자 정보
     */
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createUser(@Valid @RequestBody request: UserCreateRequest): DataResponse<UserResponse> {
        val user = userService.createUser(request)
        return DataResponse.created(user)
    }

    /**
     * ID로 사용자 정보 조회
     *
     * @param userId 사용자 ID
     * @return HTTP 200 OK와 사용자 정보
     */
    @GetMapping("/{userId}")
    fun getUserById(@PathVariable userId: Long): DataResponse<UserResponse> {
        val user = userService.getUserById(userId)
        return DataResponse.of(user)
    }
}