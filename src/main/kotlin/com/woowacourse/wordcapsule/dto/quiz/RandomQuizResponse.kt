package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level

/**
 * 랜덤 퀴즈 추천 응답 DTO
 */
data class RandomQuizResponse(
    val status: RandomQuizStatus,
    val message: String,
    val quiz: QuizConfigDetailResponse? = null,
    val userLevel: Level? = null
) {
    companion object {
        /**
         * 퀴즈 추천 성공
         */
        fun success(quiz: QuizConfigDetailResponse, userLevel: Level): RandomQuizResponse {
            return RandomQuizResponse(
                status = RandomQuizStatus.AVAILABLE,
                message = "추천 퀴즈를 찾았습니다.",
                quiz = quiz,
                userLevel = userLevel
            )
        }

        /**
         * 해당 레벨의 퀴즈를 모두 완료
         */
        fun completed(userLevel: Level): RandomQuizResponse {
            return RandomQuizResponse(
                status = RandomQuizStatus.LEVEL_COMPLETED,
                message = "현재 레벨(${userLevel.name})의 퀴즈를 모두 완료했습니다. 레벨 업그레이드를 고려해보세요!",
                quiz = null,
                userLevel = userLevel
            )
        }

        /**
         * 사용자를 찾을 수 없음
         */
        fun userNotFound(): RandomQuizResponse {
            return RandomQuizResponse(
                status = RandomQuizStatus.USER_NOT_FOUND,
                message = "사용자를 찾을 수 없습니다.",
                quiz = null,
                userLevel = null
            )
        }
    }
}

/**
 * 랜덤 퀴즈 추천 상태
 */
enum class RandomQuizStatus {
    /** 추천 가능한 퀴즈 존재 */
    AVAILABLE,

    /** 현재 레벨의 퀴즈를 모두 완료 */
    LEVEL_COMPLETED,

    /** 사용자를 찾을 수 없음 */
    USER_NOT_FOUND
}