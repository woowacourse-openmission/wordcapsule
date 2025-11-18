package com.woowacourse.wordcapsule.controller.quiz

import com.woowacourse.wordcapsule.dto.common.DataResponse
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.common.SimpleResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordDetailResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest
import com.woowacourse.wordcapsule.dto.quiz.QuizRecordStatisticResponse
import com.woowacourse.wordcapsule.service.quiz.QuizRecordServiceInterface
import jakarta.validation.Valid
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/quiz/record")
class QuizRecordController(
    private val quizRecordService: QuizRecordServiceInterface
) {

    @PostMapping
    fun createQuizRecord(@Valid @RequestBody request: QuizRecordRequest): DataResponse<Map<String, Long>> {
        val recordId = quizRecordService.createQuizRecord(request)
        return DataResponse.of(mapOf("recordId" to recordId))
    }

    @GetMapping
    fun getUserQuizRecordList(
        @RequestParam(required = false) userId: Long,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "10") size: Int,
        @RequestParam(defaultValue = "startedAt,desc") sort: String): DataResponse<PageResponse<QuizRecordListResponse>> {
        val sortDirection = if (sort.contains("desc")) Sort.Direction.DESC else Sort.Direction.ASC
        val sortProperty = sort.split(",")[0]
        val pageable = PageRequest.of(page, size, Sort.by(sortDirection, sortProperty))

        val result = quizRecordService.getUserQuizRecordList(userId, pageable)
        return DataResponse.of(result)
    }

    @GetMapping("/{recordId}")
    fun getUserQuizRecordDetail(@PathVariable recordId: Long): DataResponse<QuizRecordDetailResponse> {
        val result = quizRecordService.getUserQuizRecordDetail(recordId)
        return DataResponse.of(result)
    }

    @GetMapping("/statistic")
    fun getUserQuizRecordStatistic(@RequestParam(required = false) userId: Long): DataResponse<QuizRecordStatisticResponse> {
        val result = quizRecordService.getUserQuizRecordStatistic(userId)
        return DataResponse.of(result)
    }

    @DeleteMapping("/{recordId}")
    fun deleteQuizRecord(@PathVariable recordId: Long): SimpleResponse {
        quizRecordService.deleteQuizRecord(recordId)
        return SimpleResponse.noContent()
    }
}