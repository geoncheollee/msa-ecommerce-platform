# user-service

유저 서비스는 회원 가입, 로그인, 사용자 정보 조회 및 관리 기능을 담당하는 서비스입니다.

---

## 1. 개요

- 사용자 계정 관리 (등록, 조회, 수정, 탈퇴)
- 이메일 기반 인증 처리
- JWT 기반 로그인/인증/인가 흐름 제공

---

## 2. 기술 스택

- Java 17
- Spring Boot 3.x
- Spring Security (JWT)
- Spring Data JPA
- MariaDB 10.11
- Gradle
- JUnit5, AssertJ
- Testcontainers 테스트

---

## 3. 프로젝트 구조
```
user-service
├── domain
│ └── user
├── api
│ └── UserController.java
├── application
│ └── UserService.java
├── infrastructure
│ └── JpaUserRepository.java
├── config
└── UserServiceApplication.java
```

---

## 4. API 명세 (예시)

| 메서드 | URL             | 설명         |
|--------|------------------|--------------|
| POST   | `/api/users`     | 회원 가입    |
| POST   | `/api/users/login` | 로그인 (JWT 발급) |
| GET    | `/api/users/me`  | 내 정보 조회 |
| PATCH  | `/api/users/me`  | 닉네임/비밀번호 수정 |
| DELETE | `/api/users/me`  | 회원 탈퇴    |

> 상세한 Swagger 문서는 `/swagger-ui/index.html`에서 확인 가능

---

## 5. DB 설계

- RDBMS: MariaDB 10.11
- 테이블: `user`
- 컬럼 정보: [docs/schema.sql](./docs/schema.sql) 참조

---

## 6. 실행 방법

```bash
# application.yml 설정 후
./gradlew bootRun
```
또는 Docker Compose 통합 시
```bash
docker-compose up
```

---

## 7. 테스트

```bash
./gradlew test
```

---

## 8. 참고 자료
- JWT 흐름 설계: [링크 또는 Wiki 참조]
- 유비쿼터스 언어 문서: docs/ubiquitous-language.md
- 도메인 모델링 문서: docs/user-domain-modeling.md

---

## 
- 브랜치 전략: feature/{기능명}, fix/{수정내용}
- 커밋 컨벤션: Conventional Commits 사용
[Conventional Commits][https://www.conventionalcommits.org/ko/v1.0.0/]
