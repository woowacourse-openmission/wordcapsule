package com.woowacourse.wordcapsule.domain.quiz

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
     * @return 생성된 QuizConfig 도메인 객체 (하위 Quiz, QuizOption 포함)
     */
    fun createQuizConfig(request: QuizConfigRequest): QuizConfig {
        val quizConfig = QuizConfig(
            quizName = request.quizName,
            level = request.level
        )

        val quizzes = createQuizzes(request, quizConfig)
        return QuizConfig(
            quizName = quizConfig.quizName,
            level = quizConfig.level,
            quizzes = quizzes
        )
    }

    private fun createQuizzes(request: QuizConfigRequest, config: QuizConfig): List<Quiz> {
        return request.quizzes.map { quizRequest ->
            val quiz = Quiz(
                config = config,
                content = quizRequest.content,
                quizType = quizRequest.quizType
            )

            val options = createQuizOptions(quizRequest, quiz)
            Quiz(
                config = quiz.config,
                content = quiz.content,
                quizType = quiz.quizType,
                options = options
            )
        }
    }

    private fun createQuizOptions(
        quizRequest: com.woowacourse.wordcapsule.dto.quiz.QuizRequest,
        quiz: Quiz
    ): List<QuizOption> {
        return quizRequest.options.map { optionRequest ->
            QuizOption(
                quiz = quiz,
                content = optionRequest.content,
                position = optionRequest.position,
                isCorrect = optionRequest.isCorrect
            )
        }
    }
}