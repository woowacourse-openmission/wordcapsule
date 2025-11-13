package com.woowacourse.wordcapsule.domain.quiz

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
    @Column(name = "level", nullable = true)
    val level: Level = Level.BEGINNER,

    @OneToMany(mappedBy = "quiz", cascade = [CascadeType.ALL], fetch = FetchType.LAZY)
    val options: List<QuizOption> = emptyList()
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Quiz
        return id == other.id
    }

    override fun hashCode(): Int = id.hashCode()

    override fun toString(): String {
        return "Quiz(id=$id, content='$content', level=$level)"
    }
}