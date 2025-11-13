package com.woowacourse.wordcapsule.domain.quiz

import com.woowacourse.wordcapsule.domain.BaseEntity
import jakarta.persistence.*

/**
 * 퀴즈 선택지 엔티티
 * 각 퀴즈 문제의 답안 선택지를 관리 (정답/오답, 순서 포함)
 */
@Entity
@Table(name = "quiz_options")
class QuizOption(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "option_id")
    override val id: Long = 0L,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quiz_id", nullable = false)
    val quiz: Quiz,

    @Column(name = "content", nullable = false, length = 50)
    val content: String,

    @Column(name = "position", nullable = true)
    val position: Int? = null,

    @Column(name = "is_correct", nullable = false)
    val isCorrect: Boolean
) : BaseEntity() {

    override fun toString(): String {
        return "QuizOption(id=$id, content='$content', position=$position, isCorrect=$isCorrect)"
    }
}