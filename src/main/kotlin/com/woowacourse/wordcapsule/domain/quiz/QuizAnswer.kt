package com.woowacourse.wordcapsule.domain.quiz

import jakarta.persistence.*
import org.springframework.data.jpa.domain.support.AuditingEntityListener

/**
 * 퀴즈 답변 엔티티
 * - 한 번의 퀴즈 진행(QuizRecord)에서 각 문제(Quiz)에 대해 사용자가 고른 선택지(QuizOption)와 정답 여부를 기록
 */
@Entity
@Table(name = "quiz_answers")
@EntityListeners(AuditingEntityListener::class)
class QuizAnswer(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "answer_id")
    val id: Long = 0L,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "record_id", nullable = false)
    val record: QuizRecord,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "quiz_id", nullable = false)
    val quiz: Quiz,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "option_id", nullable = false)
    val option: QuizOption,

    /**
     * 정렬용 createdAt 대용으로 사용
     */
    @Column(name = "question_number", nullable = false)
    val questionNumber: Int,

    @Column(name = "is_correct", nullable = false)
    val isCorrect: Boolean = false,
) {

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || javaClass != other.javaClass) return false
        other as QuizAnswer
        return id == other.id
    }

    override fun hashCode(): Int = id.hashCode()

    override fun toString(): String {
        return "QuizAnswer(" +
                "id=$id, " +
                "record=${record.id}, " +
                "quiz=${quiz.id}, " +
                "option=${option.id}, " +
                "questionNumber=$questionNumber, " +
                "isCorrect=$isCorrect)"
    }
}
