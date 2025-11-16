package com.woowacourse.wordcapsule.controller.view

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizType
import com.woowacourse.wordcapsule.service.quiz.QuizConfigServiceInterface
import com.woowacourse.wordcapsule.service.quiz.QuizRecordServiceInterface
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
    private val quizRecordService: QuizRecordServiceInterface
) {

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
        model: Model
    ): String {
        val sortDirection = if (sort.contains("desc")) Sort.Direction.DESC else Sort.Direction.ASC
        val sortProperty = sort.split(",")[0]
        val pageable = PageRequest.of(page, size, Sort.by(sortDirection, sortProperty))

        val response = quizConfigService.getQuizConfigs(level, quizType, pageable)

        // 보여줄 페이지 경로 추가
        model.addAttribute("path", "content/quiz/config/list.jsp")
        // 모델에 뷰(JSP)에서 사용할 데이터를 추가
        model.addAttribute("data", response)

        return "index" // index로 고정 후 관리
    }

    @GetMapping("/game")
    fun quizGameStart(model: Model): String {
        model.addAttribute("path", "content/quiz/game.jsp")
        return "index"
    }

    @GetMapping("/records")
    fun showUserQuizRecordList(
        @RequestParam(required = false) userId: Long,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "10") size: Int,
        @RequestParam(defaultValue = "startedAt,desc") sort: String,
        model: Model
    ): String {
        val sortDirection = if (sort.contains("desc")) Sort.Direction.DESC else Sort.Direction.ASC
        val sortProperty = sort.split(",")[0]
        val pageable = PageRequest.of(page, size, Sort.by(sortDirection, sortProperty))

        val response = quizRecordService.getUserQuizRecordList(userId, pageable)

        // 보여줄 페이지 경로 추가
        model.addAttribute("path", "content/quiz/record/list.jsp")
        // 모델에 뷰(JSP)에서 사용할 데이터를 추가
        model.addAttribute("data", response)

        return "index"
    }

    @GetMapping("/records/{recordId}")
    fun showQuizRecordDetail(@PathVariable recordId: Long, model: Model): String {
        val response = quizRecordService.getUserQuizRecordDetail(recordId)

        // 보여줄 페이지 경로 추가
        model.addAttribute("path", "content/quiz/record/detail.jsp")
        // 모델에 뷰(JSP)에서 사용할 데이터를 추가
        model.addAttribute("data", response)

        return "index"
    }
}