package com.woowacourse.wordcapsule.domain.quiz

import com.woowacourse.wordcapsule.domain.user.User
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
import java.time.Duration
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
    @Column(name = "record_id", nullable = false)
    val id: Long = 0L,

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    val user: User,

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

    /** 퀴즈 이름 */
    fun getConfigName(): String {
        return config.quizName
    }

    /**
     * 정답률 (0~1)
     */
    fun getCorrectAnswerRate(): Double {
        return score.toDouble() / 10
    }

    /**
     * 평균 풀이 속도 (초)
     */
    // 시간 구하기
    fun getSolveSeconds(): Long {
        val duration = Duration.between(startedAt, completedAt)
        return duration.seconds
    }

    /**
     * 플레이 시간대 (00시 ~ 23시)
     */
    fun getSolvedTimeRange(): TimeRange {
        return TimeRange.from(completedAt.hour)
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
                "user=$user, " +
                "config=$config, " +
                "score=$score, " +
                "createdAt=$startedAt, " +
                "completedAt=$completedAt, " +
                "answers=$answers)"
    }
}