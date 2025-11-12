package com.woowacourse.wordcapsule.domain.user

import jakarta.persistence.*
import jakarta.validation.constraints.Size
import org.springframework.data.annotation.CreatedDate
import org.springframework.data.annotation.LastModifiedDate
import org.springframework.data.jpa.domain.support.AuditingEntityListener
import java.time.LocalDateTime


@Entity
@Table(name = "users")
@EntityListeners(AuditingEntityListener::class)
class User(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long? = null,

    @Column(nullable = false, unique = true, updatable = false)
    @Size(min = 5, max = 20, message = "아이디는 5자 이상 20자 이하로 입력해야 합니다.")
    var loginId: String,

    @Column(nullable = false)
    var password: String,

    @Column(nullable = false, unique = true, length = 50)
    var username: String,

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    var role: UserRole = UserRole.USER,

    @CreatedDate
    @Column(nullable = false, updatable = false)
    var createdAt: LocalDateTime? = null,

    @LastModifiedDate
    @Column(nullable = false)
    var updatedAt: LocalDateTime? = null

)