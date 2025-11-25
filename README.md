# WordCapsule

> 영어 단어 학습을 위한 퀴즈 기반 학습 플랫폼

## 프로젝트 소개 및 목적

WordCapsule은 사용자가 영어 단어를 효과적으로 학습할 수 있도록 돕는 퀴즈 기반 학습 플랫폼입니다.
사용자는 자신의 레벨에 맞는 퀴즈를 생성하고, 반복 학습을 통해 어휘력을 향상시킬 수 있습니다.

### 우테코 오픈미션 도전기
이 프로젝트는 **우아한테크코스 오픈미션**으로 진행되었습니다. 
기존 Java 개발자였던 저희가 **Kotlin**이라는 새로운 언어에 도전하며 성장 스토리를 만들어가는 과정입니다.

**생소한 기술 도입 여정**
- **Kotlin 문법과 관습**: `data class`, `companion object`, nullable 타입 등 Java와 다른 패러다임 학습
- **Spring Boot + Kotlin 조합**: 어노테이션 사용법, JPA 엔티티 설계의 Kotlin 스타일 적응
- **함수형 프로그래밍 요소**: `let`, `run`, `apply` 등 스코프 함수들의 적절한 활용법 터득
- **불변성 개념**: `val`과 `var`의 차이, 불변 객체 설계를 통한 안전한 코드 작성

**도전 과정에서의 시행착오**
- 초기에는 Java 사고방식으로 Kotlin 코드를 작성하여 언어의 장점을 제대로 활용하지 못함
- JPA 엔티티의 불변성과 양방향 연관관계 설정 사이에서 균형점 찾기
- Kotlin의 null safety 특성을 이해하고 적절히 활용하는 과정

### 주요 목표
- **기술적 도전**: Java → Kotlin 언어 전환을 통한 새로운 경험
- **개인화된 학습**: 레벨별 퀴즈 추천 시스템 구현
- **반복 학습**: 효과적인 어휘력 향상 메커니즘 제공
- **협업 경험**: 팀 단위 개발을 통한 소통과 성장

## 개발 환경

### Backend
- **Language**: Kotlin 1.9.25
- **Framework**: Spring Boot 3.5.7
- **Database**: MySQL + JPA/Hibernate
- **Build Tool**: Gradle 8.14.3
- **Java Version**: 21

### Frontend
- **Template Engine**: JSP
- **Styling**: CSS
- **Script**: JavaScript (ES6+)

### Infrastructure
- **Server**: Spring Boot Embedded Tomcat
- **Database**: MySQL 8.0+

## ERD

<img width="1112" height="681" alt="wordcapsule_erd" src="https://github.com/user-attachments/assets/32e904e5-6957-404a-9155-db95ca62ecdb" />


### 주요 엔티티
- **User**: 사용자 정보 및 레벨 관리
- **QuizConfig**: 퀴즈 설정 및 메타데이터
- **Quiz**: 개별 퀴즈 문제
- **QuizOption**: 퀴즈 선택지
- **QuizRecord**: 퀴즈 수행 기록
- **QuizAnswer**: 사용자 답안

## 프로젝트 실행 가이드

### 사전 요구사항
- Java 21+ (로컬 실행 시)
- MySQL 8.0+ (로컬 실행 시)
- Git

### 실행 방법

#### 옵션 1: Docker Compose를 사용한 실행 (권장)

Docker와 Docker Compose가 설치되어 있어야 합니다.

1. **프로젝트 클론**
   ```bash
   git clone https://github.com/woowacourse-openmission/wordcapsule.git
   cd wordcapsule
   ```

2. **Docker Compose 실행**
   ```bash
   docker-compose up -d --build
   ```
   - MySQL 컨테이너가 시작되고 테이블이 생성됩니다
   - 예제 데이터(`data.sql`)가 자동으로 로드됩니다
   - Spring Boot 애플리케이션이 8081 포트에서 실행됩니다

3. **접속**
   - URL: http://localhost:8081
   - 관리자 계정: ID `admin1`, PW `password1234`

4. **컨테이너 중지**
   ```bash
   docker-compose down
   ```

5. **로그 확인**
   ```bash
   docker-compose logs -f app
   docker-compose logs -f mysql
   ```

6. **리셋 후 실행**
    ```bash
   # 1. 컨테이너 종료 및 DB 볼륨(데이터) 삭제
   docker-compose down -v
   # 2. 이미지 새로 빌드 및 재실행
   docker-compose build --no-cache
   # 3. 다시 실행
   docker-compose up -d
   ```

#### 옵션 2: 로컬 환경에서 실행

1. **프로젝트 클론**
   ```bash
   git clone https://github.com/woowacourse-openmission/wordcapsule.git
   cd wordcapsule
   ```

2. **데이터베이스 설정**
   ```sql
   CREATE DATABASE wordcapsule;
   ```

3. **환경설정**
   ```yaml
   # src/main/resources/application.yaml 설정
   spring:
     datasource:
       url: jdbc:mysql://localhost:3306/wordcapsule
       username: [your-username]
       password: [your-password]
   ```

4. **애플리케이션 실행**
   ```bash
   ./gradlew bootRun
   ```

5. **접속**
   - URL: http://localhost:8080
   - 초기 데이터는 `data.sql` 참고

## API 명세

> 📋 [API 명세서 (Notion)](https://graceful-centaur-bbe.notion.site/wordcapsule-API-2a33b926694380068276cc1cb192030f)

### 주요 API 엔드포인트
- `POST /api/quiz/configs` - 퀴즈 생성
- `GET /api/quiz/configs` - 퀴즈 목록 조회
- `GET /api/quiz/configs/random` - 랜덤 퀴즈 추천
- `POST /api/quiz/records` - 퀴즈 수행 기록
- `GET /api/users/{id}` - 사용자 정보 조회

## 컨벤션

### 네이밍 규칙
- **패키지**: `com.woowacourse.wordcapsule.domain`
- **클래스**: PascalCase (`UserService`, `QuizConfig`)
- **메서드/변수**: camelCase (`createQuizConfig`, `userId`)
- **상수**: UPPER_SNAKE_CASE (`DEFAULT_LEVEL`)
- **테이블**: snake_case (`quiz_configs`, `quiz_options`)

### 코드 스타일
- **스타일 가이드**: [wooteco-style-guide](https://github.com/woowacourse/woowacourse-docs/tree/main/styleguide) 준수

### 커밋 컨벤션
```
type(scope): subject

body (optional)
```
- **type**: feat, fix, refactor, style, test, docs
- **scope**: user, quiz, config 등
- **예시**: `feat(quiz): 사용자 레벨 기반 랜덤 퀴즈 추천 API 구현`

## 패키지 구조

```
src/main/kotlin/com/woowacourse/wordcapsule/
├── config/                 # Spring 설정
├── controller/             # REST API 컨트롤러
│   ├── quiz/              # 퀴즈 관련 API
│   ├── user/              # 사용자 관련 API
│   └── view/              # 뷰 컨트롤러
├── domain/                # 도메인 엔티티
│   ├── quiz/              # 퀴즈 도메인
│   └── user/              # 사용자 도메인
├── dto/                   # 데이터 전송 객체
│   ├── common/            # 공통 응답 DTO
│   ├── quiz/              # 퀴즈 DTO
│   └── user/              # 사용자 DTO
├── repository/            # 데이터 접근 계층
├── service/               # 비즈니스 로직
└── WordCapsuleApplication.kt
```

## 공통 관심사항

### 전역 예외 처리
- `GlobalExceptionHandler`: 애플리케이션 전역 예외 통합 처리
- 표준화된 에러 응답 형식 제공
- HTTP 상태 코드와 커스텀 에러 메시지 매핑

### 응답 표준화
- `BaseResponse`, `DataResponse`, `ErrorResponse`: 일관된 API 응답 구조
- 성공/실패 케이스 통합 관리
- 페이징 처리를 위한 `PageResponse` 제공

### JPA 설정
- `JpaConfig`: JPA Auditing 활성화
- `BaseEntity`: 생성일시/수정일시 자동 관리
- 엔티티 생명주기 통합 관리

### 웹 설정
- `WebMvcConfig`: CORS 설정 및 인터셉터 등록
- 정적 리소스 매핑 설정

## 핵심 기능

### 1. 사용자 관리
- 회원가입/로그인
- 사용자 레벨 관리 (BEGINNER, INTERMEDIATE, ADVANCED)
- 마이페이지

### 2. 퀴즈 관리
- 퀴즈 생성 (객관식/주관식)
- 레벨별 퀴즈 분류
- 퀴즈 수정/삭제

### 3. 학습 시스템
- 레벨 기반 랜덤 퀴즈 추천
- 완료하지 않은 퀴즈 우선 추천
- 실시간 퀴즈 게임

### 4. 학습 통계
- 퀴즈 수행 기록 추적
- 정답률 통계
- 학습 진도 관리

## 트러블슈팅

### QuizConfigFactory 엔티티 생성 오류

**문제 상황**
- 퀴즈 생성 API 호출 시 QuizConfig만 저장되고 하위 Quiz, QuizOption 엔티티들이 생성되지 않음
- DTO에서 Entity로 변환은 되지만 실제 데이터는 빈 객체로만 저장되는 현상 발생

**문제점**
- QuizConfigFactory에서 `request.quizzes` 데이터를 사용하지 않고 빈 QuizConfig 객체만 반환
- 엔티티 필드가 `val List`로 불변이어서 생성 후 데이터 추가 불가능
- 양방향 연관관계 설정 로직 부재로 JPA Cascade가 제대로 작동하지 않음

**개선 방향**
- MutableList로 컬렉션 필드 변경 및 `addQuiz()`, `addOption()` 메서드 추가
- Factory에서 완전한 객체 그래프를 생성하도록 로직 개선
- 양방향 연관관계를 올바르게 설정하여 JPA Cascade 기능 활용

## 회고

### 잘한 점
- 공통 예외 처리 정책을 구성하고 적용한 점
- SOLID 원칙을 고려하며 코드를 구성한 점
- 통계 응답를 직관적인 데이터 구조로 구현한 점 (`enum` 활용)

### 어려웠던 점
- 불변 객체와 양방향 연관관계 설정 사이의 균형점 찾기
- 미구현된 엔티티에 대한 연관관계 다루기
- Kotlin의 data class, val 중심 구조에서 JPA 지연 로딩·프록시와의 충돌을 처리하는 방식 이해

### 협업에서 아쉬운 부분과 개선 방법
- 엔티티 설계 단계에서 팀원들과 더 자세한 논의가 필요했음 → 이후 주요 설계 변경 시 팀 회의를 통해 사전 공유하도록 개선
- PR 과정에서 default branch와의 충돌 → `fetch` & `merge`, `checkout`, `merge` 과정 준수 
- 공통 DTO 규격을 초기 단계에서 확정하지 못함 → 팀 회의를 통해 규격을 명확히 정리하고 전 영역을 일관되도록 리팩토링

## 팀원 소개

| 전우선 | 유어진 | 김희영 |
|--------|--------|--------|
| <img src="https://avatars.githubusercontent.com/wooxexn?v=4" width="250"> | <img src="https://avatars.githubusercontent.com/yourjinKR?v=4" width="250"> | <img src="https://avatars.githubusercontent.com/Huiyeongkim?v=4" width="250"> |
| <div align="center"><a href="https://github.com/wooxexn" target="_blank">@wooxexn</a></div> | <div align="center"><a href="https://github.com/yourjinKR" target="_blank">@yourjinKR</a></div> | <div align="center"><a href="https://github.com/Huiyeongkim" target="_blank">@Huiyeongkim</a></div> |
| <div align="center">퀴즈 설정</div> | <div align="center">퀴즈 기록</div> | <div align="center">유저</div> |

---
