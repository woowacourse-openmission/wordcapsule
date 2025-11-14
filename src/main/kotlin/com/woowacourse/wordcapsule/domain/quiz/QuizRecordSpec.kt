package com.woowacourse.wordcapsule.domain.quiz

import org.springframework.data.jpa.domain.Specification

object QuizRecordSpecs {

    fun userIdEq(userId: Long): Specification<QuizRecord> =
        Specification { root, _, cb ->
            cb.equal(root.get<Long>("userId"), userId)
        }

    fun levelEq(level: Level?): Specification<QuizRecord>? =
        level?.let {
            Specification { root, _, cb -> cb.equal(root.get<Level>("level"), it) }
        }

    fun typeEq(quizType: QuizType?): Specification<QuizRecord>? =
        quizType?.let {
            Specification { root, _, cb -> cb.equal(root.get<QuizType>("quizType"), it) }
        }
}