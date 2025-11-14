package com.woowacourse.wordcapsule.repository.user

import com.woowacourse.wordcapsule.domain.user.User
import org.springframework.data.jpa.repository.JpaRepository
import java.util.Optional

interface UserRepository : JpaRepository<User, Long> {

    fun findByUsername(username: String): Optional<User>
    fun findByLoginId(loginId: String): Optional<User>
}