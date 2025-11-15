package com.woowacourse.wordcapsule.controller.user

import com.woowacourse.wordcapsule.dto.user.UserCreateRequest
import com.woowacourse.wordcapsule.service.user.UserServiceInterface
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping

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
        return "redirect:/view/users"
    }

}