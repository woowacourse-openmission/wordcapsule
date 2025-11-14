package com.woowacourse.wordcapsule.domain.quiz

import jakarta.persistence.CascadeType
import jakarta.persistence.Column
import jakarta.persistence.Entity
import jakarta.persistence.EntityListeners
import jakarta.persistence.FetchType
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import jakarta.persistence.JoinColumn
import jakarta.persistence.ManyToOne
import jakarta.persistence.OneToMany
import jakarta.persistence.Table
import org.springframework.data.jpa.domain.support.AuditingEntityListener
import java.time.LocalDateTime

/**
 * 퀴즈 기록 엔티티
 * - 사용자가 문제를 풀면 풀이한 퀴즈에 대한 총 점수와 같은 기록을 저장
 */
@Entity
@Table(name = "quiz_records")
@EntityListeners(AuditingEntityListener::class)
open class QuizRecord(
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "record_id")
    val id: Long = 0L,

    // TODO : user 연관관계 매핑
    @Column(name = "user_id", nullable = false)
    val userId: Long,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "config_id", nullable = false)
    val config: QuizConfig,

    @Column(name = "score")
    var score: Int = 0,

    @Column(name = "started_at", nullable = false, updatable = false)
    val startedAt: LocalDateTime,

    @Column(name = "completed_at", nullable = false, updatable = false)
    var completedAt: LocalDateTime,

    @OneToMany(mappedBy = "record", cascade = [CascadeType.ALL], orphanRemoval = true, fetch = FetchType.LAZY)
    val answers: MutableList<QuizAnswer> = mutableListOf()
) {
    /** 정답 기록 추가 */
    fun addAnswer(answer: QuizAnswer) {
        answers.add(answer)
    }

    /** 채점 후 점수 갱신 */
    fun updateScore(newScore: Int) {
        this.score = newScore
    }

    /** 완료 시간 기록 */
    fun markCompleted() {
        this.completedAt = LocalDateTime.now()
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as QuizRecord
        return true
    }

    override fun hashCode(): Int = id.hashCode()

    override fun toString(): String {
        return "QuizRecord(" +
                "id=$id, " +
                "userId=$userId, " +
                "config=$config, " +
                "score=$score, " +
                "createdAt=$startedAt, " +
                "completedAt=$completedAt, " +
                "answers=$answers)"
    }
}