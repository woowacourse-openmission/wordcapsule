package com.woowacourse.wordcapsule.controller.user

import com.woowacourse.wordcapsule.dto.common.DataResponse
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.common.SimpleResponse
import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserResponse
import com.woowacourse.wordcapsule.dto.user.UserUpdateRequest
import com.woowacourse.wordcapsule.service.user.UserServiceInterface
import jakarta.validation.Valid
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
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
     * 사용자 목록을 페이징하여 조회
     *
     * @param page 페이지 번호 (기본값: 0)
     * @param size 페이지 크기 (기본값: 10)
     * @param sort 정렬 기준 (기본값: createdAt,desc)
     * @return HTTP 200 OK와 페이징된 사용자 목록
     */
    @GetMapping
    fun getUsers(
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "10") size: Int,
        @RequestParam(defaultValue = "createdAt,desc") sort: String,
        @RequestHeader("User-Id") currentUserId: Long
    ): DataResponse<PageResponse<UserResponse>> {
        val sortDirection = if (sort.contains("desc")) Sort.Direction.DESC else Sort.Direction.ASC
        val sortProperty = sort.split(",")[0].trim()
        val pageable = PageRequest.of(page, size, Sort.by(sortDirection, sortProperty))

        val result = userService.getUsers(currentUserId, pageable)
        return DataResponse.of(result)
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

    /**
     * 사용자 정보 수정
     *
     * @param currentUserId 현재 로그인한 사용자 ID
     * @param request 수정할 정보 (password, username)
     * @return HTTP 200 OK와 수정된 사용자 정보
     */
    @PatchMapping
    fun updateUser(
        @RequestHeader("User-Id") currentUserId: Long,
        @Valid @RequestBody request: UserUpdateRequest
    ): DataResponse<UserResponse> {
        val user = userService.updateUser(currentUserId, request)
        return DataResponse.of(user)
    }

    /**
     * 사용자 정보 삭제
     *
     * @param userId 삭제할 사용자 ID
     * @param currentUserId 현재 로그인한 사용자 ID
     * @return HTTP 204 No Content
     */
    @DeleteMapping("/{userId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteUser(
        @PathVariable userId: Long,
        @RequestHeader("User-Id") currentUserId: Long
    ): SimpleResponse {
        userService.deleteUser(currentUserId, userId)
        return SimpleResponse.noContent()
    }
}