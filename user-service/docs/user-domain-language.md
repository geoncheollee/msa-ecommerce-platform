# 📘 user-service: 유비쿼터스 언어 정의

> 본 문서는 `user-service`에서 사용하는 도메인 언어(유비쿼터스 언어)를 정의한 문서입니다.  
> 각 용어는 Bounded Context 내부에서만 유효하며, 해당 문맥에서의 의미와 책임을 함께 명시합니다.

---

## 🧩 핵심 도메인 용어

| 용어 | 설명 | 도메인 역할 | 사용 맥락 |
|------|------|--------------|-----------|
| **User** | 이메일/비밀번호로 가입하고 인증하는 시스템 이용자 | Aggregate Root | 회원가입, 로그인, 주문 연계 등 |
| **Signup** | 새로운 회원 정보를 입력받아 등록하는 절차 | Command | POST `/users/signup` API |
| **Login** | 사용자의 이메일/비밀번호를 검증하고 토큰 발급 | Command | POST `/users/login`, JWT 생성 |
| **JWT Token** | 인증된 사용자의 요청을 인증하기 위한 서명된 토큰 | Value Object | Authorization 헤더로 전달됨 |
| **Role** | 사용자의 권한 유형 (e.g., USER, ADMIN) | Enum | 보안 필터, 관리자 기능 제어 |
| **PasswordEncoder** | 평문 비밀번호를 안전하게 암호화하는 컴포넌트 | Service | 회원가입/로그인 시 암호화 수행 |
| **TokenProvider** | JWT 토큰 생성 및 검증 로직 담당 | Domain Service | 로그인, 인증 필터 |
| **UserGrade** | 사용자 등급 (BASIC, VIP 등) | Enum / 정책 | 누적 구매액, 이벤트 참여 등으로 승급 |

---

## 🧭 보조 개념 및 외부 연계

| 용어 | 설명 | 관련성 |
|------|------|--------|
| **Kafka Event - UserRegistered** | 회원가입 완료 시 발행되는 이벤트 | order-service, marketing-service 등 |
| **Refresh Token** | 장기 로그인 유지를 위한 토큰 | Redis 저장 또는 DB 사용 |
| **MyPage** | 사용자가 본인의 정보를 조회/수정할 수 있는 페이지 | 인증 필요 API |

---

## 🗂 파일/패키지 구조 대응표 (예시)

| 용어 | 클래스/패키지 예시 | 역할 |
|------|----------------------|------|
| User | `domain/User.java` | JPA Entity |
| UserController | `controller/UserController.java` | API 진입점 |
| UserService | `service/UserService.java` | 비즈니스 로직 |
| JwtProvider | `security/JwtProvider.java` | JWT 발급/검증 로직 |
| AuthDto | `dto/LoginRequest`, `TokenResponse` | 요청/응답 객체 |

---

## ✅ 참고

- 이 문서는 `user-service` 내부에서만 유효한 언어 체계를 기반으로 합니다.
- 도메인 간 용어가 중복되더라도, 각 서비스 내부에서는 의미가 달라질 수 있습니다.
- 다른 서비스와 연동하는 이벤트, 메시지 정의도 향후 포함될 수 있습니다.

