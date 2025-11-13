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
    open val createdAt: LocalDateTime = LocalDateTime.now()
    
    @LastModifiedDate
    @Column(name = "updated_at")
    open val updatedAt: LocalDateTime = LocalDateTime.now()
    
    /**
     * 각 엔티티에서 구현해야 하는 ID 접근 메소드
     */
    abstract val id: Long
    
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        return id == (other as BaseEntity).id
    }

    override fun hashCode(): Int = id.hashCode()
}