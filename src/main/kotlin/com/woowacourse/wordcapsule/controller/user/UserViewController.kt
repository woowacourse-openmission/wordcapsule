package com.woowacourse.wordcapsule.controller.user

import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.service.user.UserServiceInterface
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
        val storedPassword = userService.findPasswordByLoginId(loginId)

        if (storedPassword != password) {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.")
            return "content/user/login"
        }

        session.setAttribute("loginId", loginId)
        return "redirect:/"
    }

}