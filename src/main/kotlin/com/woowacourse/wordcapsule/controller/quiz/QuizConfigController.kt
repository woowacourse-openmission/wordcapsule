package com.woowacourse.wordcapsule.controller.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizType
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import com.woowacourse.wordcapsule.service.quiz.QuizConfigServiceInterface
import jakarta.validation.Valid
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Sort
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

    /**
     * 퀴즈 설정 목록을 페이징하여 조회
     *
     * @param level 레벨 필터 (선택사항)
     * @param quizType 퀴즈 타입 필터 (선택사항)
     * @param page 페이지 번호 (기본값: 0)
     * @param size 페이지 크기 (기본값: 10)
     * @param sort 정렬 기준 (기본값: createdAt,desc)
     * @return HTTP 200 OK와 페이징된 퀴즈 설정 목록
     */
    @GetMapping
    fun getQuizConfigs(
        @RequestParam(required = false) level: Level?,
        @RequestParam(required = false) quizType: QuizType?,
        @RequestParam(defaultValue = "0") page: Int,
        @RequestParam(defaultValue = "10") size: Int,
        @RequestParam(defaultValue = "createdAt,desc") sort: String
    ): ResponseEntity<PageResponse<QuizConfigListResponse>> {
        val sortDirection = if (sort.contains("desc")) Sort.Direction.DESC else Sort.Direction.ASC
        val sortProperty = sort.split(",")[0]
        val pageable = PageRequest.of(page, size, Sort.by(sortDirection, sortProperty))

        val result = quizConfigService.getQuizConfigs(level, quizType, pageable)
        return ResponseEntity.ok(result)
    }
}