package com.woowacourse.wordcapsule.repository.user

import com.woowacourse.wordcapsule.domain.user.User
import org.springframework.data.jpa.repository.JpaRepository

interface UserRepository : JpaRepository<User, Long> {

}