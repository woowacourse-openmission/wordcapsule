package com.woowacourse.wordcapsule.repository.quiz

import com.woowacourse.wordcapsule.domain.quiz.QuizOption
import org.springframework.data.jpa.repository.JpaRepository

interface QuizOptionRepository: JpaRepository<QuizOption, Long> {
}