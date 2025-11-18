package com.woowacourse.wordcapsule.domain

import jakarta.persistence.*
import org.springframework.data.annotation.CreatedDate
import org.springframework.data.annotation.LastModifiedDate
import org.springframework.data.jpa.domain.support.AuditingEntityListener
import java.time.LocalDateTime

/**
 * 모든 엔티티의 공통 필드를 정의하는 기본 엔티티
 * 생성일시, 수정일시를 포함 (ID는 각 엔티티에서 개별 정의)
 */
@MappedSuperclass
@EntityListeners(AuditingEntityListener::class)
abstract class BaseEntity {

    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    open lateinit var createdAt: LocalDateTime

    @LastModifiedDate
    @Column(name = "updated_at")
    open lateinit var updatedAt: LocalDateTime

}