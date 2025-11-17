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
        // 1단계: QuizConfig 먼저 생성 (빈 quizzes로)
        val quizConfig = QuizConfig(
            user = user,
            quizName = request.quizName,
            level = request.level
        )

        // 2단계: Quiz들을 생성하면서 QuizOption들도 함께 생성
        val createdQuizzes = request.quizzes.map { quizRequest ->
            // 먼저 Quiz 생성 (options는 빈 리스트로)
            val quiz = Quiz(
                config = quizConfig,
                content = quizRequest.content,
                quizType = quizRequest.quizType
            )

            // 그 다음 QuizOption들 생성 (quiz 참조 포함)
            val quizOptions = quizRequest.options.mapIndexed { index, optionRequest ->
                QuizOption(
                    quiz = quiz,
                    content = optionRequest.content,
                    position = index + 1,
                    isCorrect = optionRequest.isCorrect
                )
            }

            // Quiz 반환 (JPA Cascade로 QuizOption들도 함께 저장됨)
            quiz
        }

        // 3단계: 생성된 퀴즈들과 함께 QuizConfig 반환
        // JPA Cascade로 인해 저장 시 모든 하위 엔티티가 함께 저장됨
        return quizConfig
    }
}