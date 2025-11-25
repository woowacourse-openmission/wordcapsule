# 빌드 스테이지
FROM gradle:8.14.3-jdk21 AS builder
WORKDIR /build

# 소스 코드 복사
COPY . .

# Gradle 빌드
RUN gradle clean bootWar -x test

# 런타임 스테이지
FROM eclipse-temurin:21-jre
WORKDIR /app

# 빌드된 WAR 파일 복사
COPY --from=builder /build/build/libs/*.war app.war

# 포트 노출
EXPOSE 8080

# Spring Boot 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "app.war"]
