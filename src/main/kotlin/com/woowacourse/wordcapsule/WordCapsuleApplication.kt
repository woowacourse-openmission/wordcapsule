package com.woowacourse.wordcapsule

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.data.jpa.repository.config.EnableJpaAuditing

@SpringBootApplication
@EnableJpaAuditing
class WordCapsuleApplication

fun main(args: Array<String>) {
	runApplication<WordCapsuleApplication>(*args)
}
