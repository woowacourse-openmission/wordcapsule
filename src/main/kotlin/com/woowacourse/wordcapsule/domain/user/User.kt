package com.woowacourse.wordcapsule.domain.user

import com.woowacourse.wordcapsule.domain.BaseEntity
import com.woowacourse.wordcapsule.domain.quiz.Level

import jakarta.persistence.*
import jakarta.validation.constraints.Size

@Entity
@Table(name = "users")
class User(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0L,

    @field:Size(min = 5, max = 20, message = "아이디는 5자 이상 20자 이하로 입력해야 합니다.")
    @Column(name = "login_id", nullable = false, unique = true, updatable = false)
    val loginId: String,

    @Column(name = "password", nullable = false)
    var password: String,

    @Column(nullable = false, unique = true, length = 50)
    var username: String,

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    var role: UserRole = UserRole.USER,

    @Enumerated(EnumType.STRING)
    @Column(name = "level", nullable = false)
    var level: Level = Level.BEGINNER,

) : BaseEntity() {

    fun updateProfile(password: String?, username: String?, level: Level?) {
        password?.let { this.password = it }
        username?.let { this.username = it }
        level?.let { this.level = it }
    }

}