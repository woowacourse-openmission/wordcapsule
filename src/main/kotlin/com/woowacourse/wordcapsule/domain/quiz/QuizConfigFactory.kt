package com.woowacourse.wordcapsule.domain.quiz

import com.woowacourse.wordcapsule.domain.user.User
import com.woowacourse.wordcapsule.dto.quiz.QuizConfigRequest

/**
 * QuizConfig 도메인 객체 생성을 담당하는 팩토리 클래스
 * 복잡한 객체 생성 로직을 캡슐화하여 단일 책임 원칙을 준수
 */
object QuizConfigFactory {

    /**
     * 퀴즈 설정 요청 정보로부터 QuizConfig 도메인 객체를 생성
     *
     * @param request 퀴즈 설정 생성 요청 DTO
     * @param user User 엔티티 (영속성 컨텍스트에서 관리)
     * @return 생성된 QuizConfig 도메인 객체 (하위 Quiz, QuizOption 포함)
     */
    fun createQuizConfig(request: QuizConfigRequest, user: User): QuizConfig {
        return QuizConfig(
            user = user,
            quizName = request.quizName,
            level = request.level
        )
    }
}