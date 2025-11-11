package com.woowacourse.wordcapsule.service.quiz

import com.woowacourse.wordcapsule.dto.quiz.QuizRecordRequest

interface QuizRecordServiceInterface {
    fun createQuizRecord(request: QuizRecordRequest): Long
}