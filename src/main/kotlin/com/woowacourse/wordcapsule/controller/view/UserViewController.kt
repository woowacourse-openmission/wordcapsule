package com.woowacourse.wordcapsule.controller.view

import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserUpdateRequest
import com.woowacourse.wordcapsule.service.user.UserServiceInterface
import jakarta.persistence.EntityNotFoundException
import jakarta.servlet.http.HttpSession
import org.springframework.data.domain.PageRequest
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam

/**
 * 사용자 관리를 위한 뷰 컨트롤러
 */
@Controller
@RequestMapping("/users")
class UserViewController(
    private val userService: UserServiceInterface
) {

    /**
     * 사용자 등록 페이지
     */
    @GetMapping("/new")
    fun newUserForm(model: Model): String {
        return "content/user/form"
    }

    /**
     * 사용자 등록 처리
     */
    @PostMapping("/new")
    fun createUser(request: UserCreateRequest): String {
        userService.createUser(request)
        return "redirect:/users/login"
    }

    /**
     * 로그인 페이지
     */
    @GetMapping("/login")
    fun loginForm(): String {
        return "content/user/login"
    }

    /**
     * 로그인 처리
     */
    @PostMapping("/login")
    fun login(
        @RequestParam loginId: String,
        @RequestParam password: String,
        session: HttpSession,
        model: Model
    ): String {
        return try {
            userService.validateLogin(loginId, password)
            session.setAttribute("loginId", loginId)
            "redirect:/"
        } catch (e: EntityNotFoundException) {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.")
            "content/user/login"
        } catch (e: IllegalArgumentException) {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.")
            "content/user/login"
        }
    }

    /**
     * 로그아웃 처리
     */
    @GetMapping("/logout")
    fun logout(session: HttpSession): String {
        session.invalidate()
        return "redirect:/users/login"
    }

    /**
     * 아이디 찾기 페이지
     */
    @GetMapping("/find-id")
    fun findIdForm(): String {
        return "content/user/find-id"
    }

    /**
     * 아이디 찾기 처리
     */
    @PostMapping("/find-id")
    fun findId(
        @RequestParam username: String,
        model: Model
    ): String {
        return try {
            val foundLoginId = userService.findLoginIdByUsername(username)
            model.addAttribute("foundLoginId", foundLoginId)
            "content/user/find-id"
        } catch (e: EntityNotFoundException) {
            model.addAttribute("error", "해당 사용자 이름을 찾을 수 없습니다.")
            "content/user/find-id"
        }
    }

    /**
     * 비밀번호 찾기 페이지
     */
    @GetMapping("/find-password")
    fun findPasswordForm(): String {
        return "content/user/find-password"
    }

    /**
     * 비밀번호 찾기 처리
     */
    @PostMapping("/find-password")
    fun findPassword(
        @RequestParam loginId: String,
        model: Model
    ): String {
        return try {
            val password = userService.findPasswordByLoginId(loginId)
            model.addAttribute("password", password)
            "content/user/find-password"
        } catch (e: EntityNotFoundException) {
            model.addAttribute("error", "해당 아이디를 찾을 수 없습니다.")
            "content/user/find-password"
        }
    }

    /**
     * 마이페이지
     */
    @GetMapping("/mypage")
    fun mypage(session: HttpSession, model: Model): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/users/login"

        return try {
            val user = userService.getUserByLoginId(loginId)
            model.addAttribute("path", "content/user/mypage.jsp")
            model.addAttribute("data", user)
            "index"
        } catch (e: EntityNotFoundException) {
            "redirect:/users/login"
        }
    }

    /**
     * 정보 수정 페이지
     */
    @GetMapping("/edit")
    fun editForm(session: HttpSession, model: Model): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/users/login"

        return try {
            val user = userService.getUserByLoginId(loginId)
            model.addAttribute("path", "content/user/edit.jsp")
            model.addAttribute("data", user)
            "index"
        } catch (e: EntityNotFoundException) {
            "redirect:/users/login"
        }
    }

    /**
     * 정보 수정 처리
     */
    @PostMapping("/edit")
    fun edit(
        @RequestParam(required = false) username: String?,
        @RequestParam(required = false) password: String?,
        @RequestParam(required = false) level: com.woowacourse.wordcapsule.domain.quiz.Level?,
        session: HttpSession
    ): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/users/login"

        return try {
            val user = userService.getUserByLoginId(loginId)
            // 빈 문자열을 null로 변환
            val updatedPassword = password?.ifBlank { null }
            val updatedUsername = username?.ifBlank { null }
            val request = UserUpdateRequest(updatedPassword, updatedUsername, level)
            userService.updateUser(user.id, request)

            "redirect:/users/mypage"
        } catch (e: EntityNotFoundException) {
            "redirect:/users/login"
        }
    }

    /**
     * 회원 탈퇴 처리
     */
    @PostMapping("/delete")
    fun deleteAccount(session: HttpSession): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/users/login"

        return try {
            val user = userService.getUserByLoginId(loginId)
            userService.deleteUser(user.id, user.id)
            session.invalidate()
            "redirect:/users/login"
        } catch (e: EntityNotFoundException) {
            "redirect:/users/login"
        }
    }

    /**
     * 관리자 - 회원 목록 조회
     */
    @GetMapping("/list")
    fun userList(
        session: HttpSession,
        model: Model,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "10") size: Int
    ): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/users/login"

        return try {
            val currentUser = userService.getUserByLoginId(loginId)
            val pageable = PageRequest.of(page, size)
            val users = userService.getUsers(currentUser.id, pageable)

            model.addAttribute("path", "content/user/list.jsp")
            model.addAttribute("data", mapOf(
                "users" to users,
                "currentPage" to page,
                "currentUserId" to currentUser.id
            ))
            "index"
        } catch (e: IllegalAccessException) {
            model.addAttribute("error", "관리자만 접근할 수 있습니다.")
            "redirect:/users/mypage"
        } catch (e: EntityNotFoundException) {
            "redirect:/users/login"
        }
    }

    /**
     * 관리자 - 회원 삭제
     */
    @PostMapping("/delete/{userId}")
    fun deleteUserByAdmin(
        @PathVariable userId: Long,
        session: HttpSession,
        @RequestParam(defaultValue = "0") page: Int
    ): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/users/login"

        return try {
            val currentUser = userService.getUserByLoginId(loginId)
            userService.deleteUser(currentUser.id, userId)
            "redirect:/users/list?page=$page"
        } catch (e: IllegalAccessException) {
            "redirect:/users/list?page=$page&error=permission"
        } catch (e: EntityNotFoundException) {
            "redirect:/users/list?page=$page&error=notfound"
        }
    }

}