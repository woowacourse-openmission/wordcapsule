package com.woowacourse.wordcapsule.domain.quiz

import com.woowacourse.wordcapsule.domain.BaseEntity
import jakarta.persistence.*

/**
 * 개별 퀴즈 문제 엔티티
 * 퀴즈 설정 하위에 속하며, 문제 내용과 선택지들을 관리
 */
@Entity
@Table(name = "quizzes")
class Quiz(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "quiz_id")
    val id: Long = 0L,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "config_id", nullable = false)
    val config: QuizConfig,

    @Column(name = "content", nullable = false, length = 50)
    val content: String,

    @Enumerated(EnumType.STRING)
    @Column(name = "quiz_type", nullable = false)
    val quizType: QuizType,

    @OneToMany(mappedBy = "quiz", cascade = [CascadeType.ALL], fetch = FetchType.LAZY)
    val options: List<QuizOption> = emptyList()
) : BaseEntity() {

    override fun toString(): String {
        return "Quiz(id=$id, content='$content', quizType=$quizType)"
    }
}