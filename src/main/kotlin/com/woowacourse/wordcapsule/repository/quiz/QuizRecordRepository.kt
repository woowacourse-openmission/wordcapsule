package com.woowacourse.wordcapsule.repository.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizRecord
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.JpaSpecificationExecutor

interface QuizRecordRepository : JpaRepository<QuizRecord, Long>, JpaSpecificationExecutor<QuizRecord> {
    fun findAllByUserId(userId: Long, pageable: Pageable): Page<QuizRecord>
    fun findAllByUserId(userId: Long): MutableList<QuizRecord>
}