package com.woowacourse.wordcapsule.service.user

import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserResponse
import com.woowacourse.wordcapsule.dto.user.UserUpdateRequest
import org.springframework.data.domain.Pageable

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

    /**
     * 사용자 목록을 페이징하여 조회
     *
     * @param pageable 페이징 정보
     * @return 페이징된 사용자 목록
     */
    fun getUsers(currentUserId: Long, pageable: Pageable): PageResponse<UserResponse>

    /**
     * ID로 사용자 정보 조회
     *
     * @param userId 사용자 ID
     * @return 사용자 정보
     * @throws jakarta.persistence.EntityNotFoundException 사용자를 찾을 수 없는 경우
     */
    fun getUserById(userId: Long): UserResponse

    /**
     * 사용자 정보 수정
     *
     * @param currentUserId 현재 로그인한 사용자 ID
     * @param request 수정할 정보
     * @return 수정된 사용자 정보
     * @throws jakarta.persistence.EntityNotFoundException 사용자를 찾을 수 없는 경우
     * @throws IllegalAccessException 본인이 아닌 경우
     */
    fun updateUser(currentUserId: Long, request: UserUpdateRequest): UserResponse

    /**
     * 사용자 정보 삭제
     *
     * @param currentUserId 현재 로그인한 사용자 ID
     * @param userId 삭제할 사용자 ID
     * @throws jakarta.persistence.EntityNotFoundException 사용자를 찾을 수 없는 경우
     * @throws IllegalAccessException 본인이 아니고 관리자도 아닌 경우
     */
    fun deleteUser(currentUserId: Long, userId: Long)
}