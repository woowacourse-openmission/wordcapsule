package com.woowacourse.wordcapsule.repository.quiz

import com.woowacourse.wordcapsule.domain.quiz.Level
import com.woowacourse.wordcapsule.domain.quiz.QuizConfig
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import com.woowacourse.wordcapsule.domain.quiz.QuizType

/**
 * 퀴즈 설정 데이터 접근을 위한 Repository 인터페이스
 */
interface QuizConfigRepository : JpaRepository<QuizConfig, Long> {

    /**
     * 레벨별 퀴즈 설정 목록 조회
     */
    fun findByLevel(level: Level, pageable: Pageable): Page<QuizConfig>

    /**
     * 퀴즈 타입별 퀴즈 설정 목록 조회 (하위 퀴즈의 타입으로 검색)
     */
    @Query("SELECT DISTINCT qc FROM QuizConfig qc JOIN qc.quizzes q WHERE q.quizType = :quizType")
    fun findByQuizType(quizType: QuizType, pageable: Pageable): Page<QuizConfig>

    /**
     * 레벨과 퀴즈 타입으로 퀴즈 설정 목록 조회
     */
    @Query("SELECT DISTINCT qc FROM QuizConfig qc JOIN qc.quizzes q WHERE qc.level = :level AND q.quizType = :quizType")
    fun findByLevelAndQuizType(level: Level, quizType: QuizType, pageable: Pageable): Page<QuizConfig>
}