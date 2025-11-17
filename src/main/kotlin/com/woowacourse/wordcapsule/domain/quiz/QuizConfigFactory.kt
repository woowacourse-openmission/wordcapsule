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
     * JPA Cascade 설정에 의해 QuizConfig 저장 시 모든 하위 엔티티가 자동 저장됨
     *
     * @param request 퀴즈 설정 생성 요청 DTO
     * @param user User 엔티티 (영속성 컨텍스트에서 관리)
     * @return 생성된 QuizConfig 도메인 객체 (하위 Quiz, QuizOption 포함)
     */
    fun createQuizConfig(request: QuizConfigRequest, user: User): QuizConfig {
        // QuizConfig를 먼저 생성 (빈 quizzes로 시작)
        val quizConfig = QuizConfig(
            user = user,
            quizName = request.quizName,
            level = request.level,
            quizzes = emptyList()
        )

        // Quiz들과 QuizOption들을 함께 생성
        val quizzes = request.quizzes.map { quizRequest ->
            // Quiz 생성 (QuizConfig 참조)
            val quiz = Quiz(
                config = quizConfig,
                content = quizRequest.content,
                quizType = quizRequest.quizType,
                options = emptyList()  // 일단 빈 리스트로 시작
            )

            // QuizOption들 생성 (Quiz 참조)
            val quizOptions = quizRequest.options.mapIndexed { index, optionRequest ->
                QuizOption(
                    quiz = quiz,
                    content = optionRequest.content,
                    position = index + 1,
                    isCorrect = optionRequest.isCorrect
                )
            }

            // 완전한 Quiz 객체 생성 (options 포함)
            Quiz(
                config = quizConfig,
                content = quizRequest.content,
                quizType = quizRequest.quizType,
                options = quizOptions
            )
        }

        // 완전한 QuizConfig 객체 반환 (모든 하위 엔티티 포함)
        return QuizConfig(
            user = user,
            quizName = request.quizName,
            level = request.level,
            quizzes = quizzes
        )
    }
}