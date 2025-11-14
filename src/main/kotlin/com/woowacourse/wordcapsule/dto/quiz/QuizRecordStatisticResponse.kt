package com.woowacourse.wordcapsule.dto.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizRecord
import com.woowacourse.wordcapsule.domain.quiz.TimeRange
import com.woowacourse.wordcapsule.service.quiz.QuizRecordService
import java.util.EnumMap

/**
 * - streakDays : 연속 퀴즈 풀이 일수 (현재 기준)
 * - correctAnswerRate : 정답률 (0~1)
 * - averageSolveTime : 평균 풀이 속도 (초)
 * - activePlayTimeRange : 플레이 시간대 (00시 ~ 23시)
 */
data class QuizRecordStatisticResponse(
    val streakDays: Int,
    val correctAnswerRate: Double,
    val averageSolveTime: Double,
    val activePlayTimeRange: EnumMap<TimeRange, Int>,
) {
    companion object {
        fun from(quizRecordList: List<QuizRecord>): QuizRecordStatisticResponse {
            val dateList = quizRecordList.map { it.startedAt }
            val streakDays = QuizRecordService.getStreakDay(dateList)

            val scoreList = quizRecordList.map { it.getCorrectAnswerRate() }
            val correctAnswerRate = scoreList.sum() / scoreList.size

            val averageSolveTime = quizRecordList.map { it.getSolveSeconds() }.average()

            val activePlayTimeRange = EnumMap(
                TimeRange.entries.associateWith { range ->
                    quizRecordList
                        .map { it.getSolvedTimeRange() }
                        .groupingBy { it }
                        .eachCount()[range] ?: 0
                }
            )

            return QuizRecordStatisticResponse(
                streakDays = streakDays,
                correctAnswerRate = correctAnswerRate,
                averageSolveTime = averageSolveTime,
                activePlayTimeRange = activePlayTimeRange
            )
        }
    }
}
