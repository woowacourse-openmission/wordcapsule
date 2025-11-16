package com.woowacourse.wordcapsule.domain.quiz

import com.woowacourse.wordcapsule.domain.BaseEntity
import com.woowacourse.wordcapsule.domain.user.User
import jakarta.persistence.*

/**
 * 퀴즈 설정 엔티티
 * 퀴즈의 기본 정보(이름, 타입, 난이도)와 하위 퀴즈 문제들을 관리
 */
@Entity
@Table(name = "quiz_configs")
class QuizConfig(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "config_id")
    val id: Long = 0L,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    val user: User,

    @Column(name = "quiz_name", nullable = false, length = 100)
    var quizName: String,

    @Enumerated(EnumType.STRING)
    @Column(name = "level", nullable = false)
    var level: Level = Level.BEGINNER,

    @OneToMany(mappedBy = "config", cascade = [CascadeType.ALL], fetch = FetchType.LAZY)
    val quizzes: List<Quiz> = emptyList()
) : BaseEntity() {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as QuizConfig
        return id == other.id
    }

    override fun hashCode(): Int = id.hashCode()

    override fun toString(): String {
        return "QuizConfig(id=$id, quizName='$quizName', level=$level)"
    }
}