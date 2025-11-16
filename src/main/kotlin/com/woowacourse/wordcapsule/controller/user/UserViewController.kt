package com.woowacourse.wordcapsule.controller.user

import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.dto.user.UserUpdateRequest
import com.woowacourse.wordcapsule.service.user.UserServiceInterface
import jakarta.persistence.EntityNotFoundException
import jakarta.servlet.http.HttpSession
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam

/**
 * 사용자 관리를 위한 뷰 컨트롤러
 */
@Controller
@RequestMapping("/view/users")
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
        return "redirect:/view/users/login"
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
        return "redirect:/view/users/login"
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
            ?: return "redirect:/view/users/login"

        return try {
            val user = userService.getUserByLoginId(loginId)
            model.addAttribute("user", user)
            "content/user/mypage"
        } catch (e: EntityNotFoundException) {
            "redirect:/view/users/login"
        }
    }

    /**
     * 정보 수정 페이지
     */
    @GetMapping("/edit")
    fun editForm(session: HttpSession, model: Model): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/view/users/login"

        return try {
            val user = userService.getUserByLoginId(loginId)
            model.addAttribute("user", user)
            "content/user/edit"
        } catch (e: EntityNotFoundException) {
            "redirect:/view/users/login"
        }
    }

    /**
     * 정보 수정 처리
     */
    @PostMapping("/edit")
    fun edit(
        @RequestParam(required = false) username: String?,
        @RequestParam(required = false) password: String?,
        session: HttpSession
    ): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/view/users/login"

        return try {
            val user = userService.getUserByLoginId(loginId)
            val request = UserUpdateRequest(password, username)
            userService.updateUser(user.id, request)

            "redirect:/view/users/mypage"
        } catch (e: EntityNotFoundException) {
            "redirect:/view/users/login"
        }
    }

}