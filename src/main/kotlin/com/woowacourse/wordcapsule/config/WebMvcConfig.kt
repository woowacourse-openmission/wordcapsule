package com.woowacourse.wordcapsule.config

import org.springframework.context.annotation.Configuration
import org.springframework.http.MediaType
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

@Configuration
// @EnableWebMvc 어노테이션을 제거합니다. (Spring Boot 자동 설정 유지)
class WebMvcConfig : WebMvcConfigurer {

    // 정적 리소스 핸들러 설정 (addResourceHandlers)을 제거합니다.
    // Spring Boot가 기본적으로 static 폴더를 잘 처리합니다.

    // 모듈(JS) MIME 타입을 명시적으로 설정하여 오작동 방지
    // 이 부분만 남겨서 .js 파일을 "application/javascript"로 서빙하도록 보장합니다.
    override fun configureContentNegotiation(configurer: ContentNegotiationConfigurer) {
        configurer.mediaType("js", MediaType.valueOf("application/javascript"))
    }
}