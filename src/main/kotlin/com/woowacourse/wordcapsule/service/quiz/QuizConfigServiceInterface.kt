package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizType
import com.woowacourse.wordcapsule.dto.common.PageResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigListResponse
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest
import org.springframework.data.domain.Pageable

/**
 * 퀴즈 설정 관리를 위한 서비스 인터페이스
 * 의존성 역전 원칙을 위해 추상화된 인터페이스 제공
 */
interface QuizConfigServiceInterface {

    /**
     * 퀴즈 설정을 생성하고 저장
     *
     * @param request 퀴즈 설정 생성 요청 DTO
     * @return 생성된 퀴즈 설정의 식별자
     */
    fun createQuizConfig(request: QuizConfigRequest): Long
    
    /**
     * 퀴즈 설정 목록을 페이징하여 조회
     * 
     * @param level 레벨 필터 (선택사항)
     * @param quizType 퀴즈 타입 필터 (선택사항)
     * @param pageable 페이징 정보
     * @return 페이징된 퀴즈 설정 목록
     */
    fun getQuizConfigs(level: Level?, quizType: QuizType?, pageable: Pageable): PageResponse<QuizConfigListResponse>
}