package com.woowacourse.wordcapsule.util

import org.springframework.ui.Model
import kotlin.reflect.KProperty1
import kotlin.reflect.full.memberProperties

fun Model.addAll(map: Map<String, Any?>) {
    map.forEach { (key, value) ->
        run {
            if (value != null) {
                this.addAttribute(key, value)
            }
        }
    }
}

fun Model.addFromTest(dto: Any) {
    dto::class.memberProperties
        .filterIsInstance<KProperty1<Any, *>>()
        .forEach { prop ->
            val value = prop.get(dto)
            this.addAttribute(prop.name, value)
        }
}

fun <T> Model.addFromTest2(dto: T) {
    dto!!::class.memberProperties
        .filterIsInstance<KProperty1<T, *>>()
        .forEach { prop ->
            val value = prop.get(dto)
            this.addAttribute(prop.name, value)
        }
}

inline fun <reified T : Any> Model.addFromTest3(dto: T) {
    T::class.memberProperties
        .toList()
        .forEach { prop ->
            val value = prop.get(dto)
            this.addAttribute(prop.name, value)
        }
}

/**
 * DTO를 Model attribute에 자동 매핑 함수
 */
inline fun <reified T : Any> Model.addAllAttributesFrom(dto: T) {
    T::class.memberProperties.forEach { prop ->
        val value = prop.get(dto)
        this.addAttribute(prop.name, value)
    }
}