package com.woowacourse.wordcapsule.repository.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizAnswer
import org.springframework.data.jpa.repository.JpaRepository

interface QuizAnswerRepository: JpaRepository<QuizAnswer, Long> {
}