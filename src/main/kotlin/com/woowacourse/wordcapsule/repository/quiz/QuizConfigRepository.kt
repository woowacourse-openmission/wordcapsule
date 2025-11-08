package com.woowacourse.wordcapsule.repository.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizConfig
import org.springframework.data.jpa.repository.JpaRepository

/**
 * 퀴즈 설정 데이터 접근을 위한 Repository 인터페이스
 */
interface QuizConfigRepository : JpaRepository<QuizConfig, Long>