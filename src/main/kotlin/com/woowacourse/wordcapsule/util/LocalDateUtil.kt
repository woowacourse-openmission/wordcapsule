package com.woowacourse.wordcapsule.util

import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import kotlin.math.abs

object LocalDateUtil {
    /** 연속 일 초기값 */
    const val INIT_STREAK_DAY = 1

    /** 날짜 비교 */
    fun getDayGap(today: LocalDateTime, tomorrow: LocalDateTime): Long {
        return abs(ChronoUnit.DAYS.between(today, tomorrow))
    }

    /** 연속일 구하기 */
    fun getStreakDay(dateList: List<LocalDateTime>): Int {
        var peakDay = INIT_STREAK_DAY;
        for (i in 0..<dateList.size - 1) {
            val isTomorrow = getDayGap(dateList[i], dateList[i + 1])

            when {
                isTomorrow == 0L -> peakDay
                isTomorrow == 1L -> peakDay++
                isTomorrow > 1L -> peakDay = INIT_STREAK_DAY
            }
        }
        return peakDay
    }
}