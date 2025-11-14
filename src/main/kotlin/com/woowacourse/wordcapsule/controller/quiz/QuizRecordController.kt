package com.woowacourse.wordcapsule.controller.quiz

import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest
import com.woowacourse.wordcapsule.service.quiz.QuizRecordServiceInterface
import jakarta.validation.Valid
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/quiz/record")
class QuizRecordController(
    private val quizRecordService: QuizRecordServiceInterface
) {

    @PostMapping
    fun createQuizRecord(@Valid @RequestBody request: QuizRecordRequest): ResponseEntity<Map<String, Long>> {
        val recordId = quizRecordService.createQuizRecord(request)
        return ResponseEntity.status(HttpStatus.CREATED)
            .body(mapOf("recordId" to recordId))
    }
}