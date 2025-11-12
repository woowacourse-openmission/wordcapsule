package com.woowacourse.wordcapsule.domain.quiz

import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

object QuizRecordFactory {
    fun createQuizRecord(request: QuizRecordRequest, quizConfig: QuizConfig): QuizRecord {
        val quizRecord = QuizRecord(
            userId = request.userId,
            config = quizConfig,
            score = request.score,
            startedAt = parseLdt("startedAt", request.startedAt),
            completedAt = parseLdt("completedAt", request.completedAt),
        )

        return quizRecord
    }

    /**
     *  LocalDateTime 데이터 타입에 맞도록 파싱 유틸
     */
    private fun parseLdt(fieldName: String, value: String): LocalDateTime =
        runCatching { LocalDateTime.parse(value, ISO_LOCAL) }
            .getOrElse {
                throw IllegalArgumentException(
                    "$fieldName 은(는) ISO-8601 형식(yyyy-MM-dd'T'HH:mm:ss)이어야 합니다. value=$value"
                )
            }

    private val ISO_LOCAL: DateTimeFormatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME
}