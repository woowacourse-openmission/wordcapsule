package com.woowacourse.wordcapsule.config

import org.springframework.context.annotation.Configuration
import org.springframework.data.jpa.repository.config.EnableJpaAuditing

/**
 * JPA 설정 클래스
 * JPA Auditing 기능을 활성화하여 엔티티의 생성/수정 시간을 자동 관리
 */
@Configuration
@EnableJpaAuditing
class JpaConfig