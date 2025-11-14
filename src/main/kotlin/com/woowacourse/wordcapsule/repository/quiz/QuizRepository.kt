package com.woowacourse.wordcapsule.repository.quiz

import com.woowacourse.wordcapsule.domain.quiz.Quiz
import org.springframework.data.jpa.repository.JpaRepository

interface QuizRepository: JpaRepository<Quiz, Long> {
}