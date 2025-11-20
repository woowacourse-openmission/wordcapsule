package com.woowacourse.wordcapsule.controller.view

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizType
import com.woowacourse.wordcapsule.domain.user.UserRole
import com.woowacourse.wordcapsule.service.quiz.QuizConfigServiceInterface
import com.woowacourse.wordcapsule.service.quiz.QuizRecordServiceInterface
import com.woowacourse.wordcapsule.service.user.UserServiceInterface
import com.woowacourse.wordcapsule.util.addAllAttributesFrom
import jakarta.servlet.http.HttpSession
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam

/**
 * 퀴즈 관련 웹 페이지(JSP)를 반환하기 위한 MVC 컨트롤러
 */
@Controller
@RequestMapping("/quiz")
class QuizViewController(
    private val quizConfigService: QuizConfigServiceInterface,
    private val quizRecordService: QuizRecordServiceInterface,
    private val userService: UserServiceInterface
) {
    companion object {
        const val LOGIN_PATH = "redirect:/users/login"
        const val HOME_PATH = "redirect:/"
    }

    /**
     * 퀴즈 설정 목록 페이지
     * API의 'GET /api/quiz/config'에 대응하는 뷰
     */
    @GetMapping("/configs")
    fun showQuizConfigListPage(
        @RequestParam(required = false) level: Level?,
        @RequestParam(required = false) quizType: QuizType?,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "10") size: Int,
        @RequestParam(defaultValue = "createdAt,desc") sort: String,
        model: Model,
        session: HttpSession
    ): String {
        val redirectPath = loginInterceptor(session)
        if (redirectPath != null) return redirectPath
        if (!isAdmin(session)) return HOME_PATH

        val sortDirection = if (sort.contains("desc")) Sort.Direction.DESC else Sort.Direction.ASC
        val sortProperty = sort.split(",")[0]
        val pageable = PageRequest.of(page, size, Sort.by(sortDirection, sortProperty))

        val response = quizConfigService.getQuizConfigs(level, quizType, pageable)

        model.addAttribute("path", "content/quiz/config/list.jsp")
        model.addAllAttributesFrom(response)

        return "index"
    }

    /**
     * 퀴즈 설정 상세보기 페이지
     */
    @GetMapping("/config/{configId}")
    fun showQuizConfigDetailPage(@PathVariable configId: Long, model: Model, session: HttpSession): String {
        val redirectPath = loginInterceptor(session)
        if (redirectPath != null) return redirectPath
        if (!isAdmin(session)) return HOME_PATH

        val response = quizConfigService.getQuizConfigDetail(configId)

        model.addAttribute("path", "content/quiz/config/detail.jsp")
        model.addAllAttributesFrom(response)

        return "index"
    }

    /**
     * 퀴즈 설정 생성 페이지
     */
    @GetMapping("/config/new")
    fun showQuizConfigFormPage(model: Model, session: HttpSession): String {
        val redirectPath = loginInterceptor(session)
        if (redirectPath != null) return redirectPath
        if (!isAdmin(session)) return HOME_PATH

        model.addAttribute("path", "content/quiz/config/new.jsp")

        return "index"
    }

    /**
     * 퀴즈 시작 페이지
     */
    @GetMapping("/game")
    fun quizGameStart(model: Model, session: HttpSession): String {
        val redirectPath = loginInterceptor(session)
        if (redirectPath != null) return redirectPath

        model.addAttribute("path", "content/quiz/game.jsp")
        model.addAttribute("layoutType", LayoutType.SIMPLE)
        return "index"
    }

    /**
     * 퀴즈 기록 페이지
     */
    @GetMapping("/records")
    fun showUserQuizRecordList(model: Model, session: HttpSession): String {
        val redirectPath = loginInterceptor(session)
        if (redirectPath != null) return redirectPath

        model.addAttribute("path", "content/quiz/record/list.jsp")
        return "index"
    }

    /**
     *  퀴즈 기록 상세보기 페이지
     */
    @GetMapping("/record/{recordId}")
    fun showQuizRecordDetail(@PathVariable recordId: Long, model: Model, session: HttpSession): String {
        val redirectPath = loginInterceptor(session)
        if (redirectPath != null) return redirectPath

        val response = quizRecordService.getUserQuizRecordDetail(recordId)

        model.addAttribute("path", "content/quiz/record/detail.jsp")
        model.addAllAttributesFrom(response)

        return "index"
    }

    /**
     * 어드민 확인
     */
    fun isAdmin(session: HttpSession): Boolean {
        val loginId = session.getAttribute("loginId") as String
        val currentUser = userService.getUserByLoginId(loginId)
        return currentUser.role == UserRole.ADMIN
    }

    /**
     * 로그인 인터셉터
     */
    fun loginInterceptor(session: HttpSession): String? {
        val redirectPath = session.getAttribute("loginId") as? String
            ?: return LOGIN_PATH
        return null;
    }
}