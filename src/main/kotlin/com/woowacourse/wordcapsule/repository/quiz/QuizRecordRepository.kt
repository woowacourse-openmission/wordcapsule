package com.woowacourse.wordcapsule.repository.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizRecord
import org.springframework.data.jpa.repository.JpaRepository

interface QuizRecordRepository : JpaRepository<QuizRecord, Long> {
}