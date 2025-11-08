package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest

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
}