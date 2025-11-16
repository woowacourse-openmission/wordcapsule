package com.woowacourse.wordcapsule.controller.view

import com.woowacourse.wordcapsule.service.user.UserServiceInterface
import jakarta.persistence.EntityNotFoundException
import jakarta.servlet.http.HttpSession
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping

/**
 * 홈페이지를 위한 뷰 컨트롤러
 */
@Controller
class HomeViewController(
    private val userService: UserServiceInterface
) {

    /**
     * 홈페이지
     * 로그인하지 않은 경우 로그인 페이지로 리다이렉트
     */
    @GetMapping("/")
    fun home(session: HttpSession, model: Model): String {
        val loginId = session.getAttribute("loginId") as? String
            ?: return "redirect:/users/login"

        return try {
            val user = userService.getUserByLoginId(loginId)
            model.addAttribute("path", "content/home.jsp")
            model.addAttribute("data", user)
            "index"
        } catch (e: EntityNotFoundException) {
            "redirect:/users/login"
        }
    }
}