package com.woowacourse.wordcapsule.controller.quiz

import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import com.woowacourse.wordcapsule.service.quiz.QuizConfigServiceInterface
import jakarta.validation.Valid
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

/**
 * 퀴즈 설정 관리를 위한 REST API 컨트롤러
 */
@RestController
@RequestMapping("/quiz/config")
class QuizConfigController(
    private val quizConfigService: QuizConfigServiceInterface
) {

    /**
     * 새로운 퀴즈 설정을 생성
     *
     * @param request 퀴즈 설정 생성 요청 데이터
     * @return HTTP 201 Created와 생성된 퀴즈 설정 ID
     */
    @PostMapping
    fun createQuizConfig(@Valid @RequestBody request: QuizConfigRequest): ResponseEntity<Map<String, Long>> {
        val configId = quizConfigService.createQuizConfig(request)
        return ResponseEntity.status(HttpStatus.CREATED)
            .body(mapOf("configId" to configId))
    }
}