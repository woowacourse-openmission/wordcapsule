package com.woowacourse.wordcapsule.domain.quiz

import com.woowacourse.wordcapsule.domain.BaseEntity
import jakarta.persistence.*

/**
 * 퀴즈 설정 엔티티
 * 퀴즈의 기본 정보(이름, 난이도)와 하위 퀴즈 문제들을 관리
 */
@Entity
@Table(name = "quiz_configs")
class QuizConfig(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "config_id")
    override val id: Long = 0L,

    @Column(name = "quiz_name", nullable = false, length = 50)
    val quizName: String,

    @Enumerated(EnumType.STRING)
    @Column(name = "level", nullable = true)
    val level: Level = Level.BEGINNER,

    @OneToMany(mappedBy = "config", cascade = [CascadeType.ALL], fetch = FetchType.LAZY)
    val quizzes: List<Quiz> = emptyList()
) : BaseEntity() {

    override fun toString(): String {
        return "QuizConfig(id=$id, quizName='$quizName', level=$level)"
    }
}