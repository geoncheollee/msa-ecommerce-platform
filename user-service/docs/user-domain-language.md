# user-service: 유비쿼터스 언어 정의 (한글 / 영어 병기)

> 본 문서는 `user-service`의 핵심 도메인 용어를 유비쿼터스 언어로 정의한 자료입니다.  
> 각 용어는 한글명 / 영어명을 함께 표기하며, 도메인 내에서의 책임과 사용 맥락을 명확히 합니다.

---

## 핵심 도메인 용어

| 한글명 | 영어명 | 설명 | 도메인 역할 | 사용 맥락 |
|--------|--------|------|--------------|-----------|
| 회원 | User | 이메일과 비밀번호로 가입한 사용자 | Aggregate Root | 주문, 인증 대상 |
| 회원명 | Name | 회원의 이름 |  |  |
| 회원가입 | Signup | 사용자 정보 입력 후 시스템 등록 절차 | Command | POST `/users/signup` |
| 로그인 | Login | 이메일/비밀번호 인증 후 토큰 발급 | Command | POST `/users/login` |
| 인증 토큰 | JWT Token | 인증된 사용자의 요청에 포함되는 서명된 토큰 | Value Object | Authorization 헤더 사용 |
| 권한 | Role | 사용자의 역할 (예: USER, ADMIN) | Enum | 보안 필터, 관리자 판단 |
| 비밀번호 인코더 | PasswordEncoder | 평문 비밀번호를 암호화하는 도구 | Service | 가입, 로그인 시 암호화 |
| 토큰 제공자 | TokenProvider | JWT 생성/검증을 담당하는 컴포넌트 | Domain Service | 로그인 처리, 인증 필터 |
| 회원 등급 | UserGrade | 누적 실적에 따라 부여되는 등급 (BASIC, VIP 등) | Enum / 정책 | 사용자 분류, 이벤트 제공 |

---

## 보조 개념 및 외부 연계

| 한글명 | 영어명 | 설명 | 관련성 |
|--------|--------|------|--------|
| 회원가입 이벤트 | UserRegistered Event | 회원가입 완료 시 발행되는 Kafka 이벤트 | order-service, 알림 등 |
| 리프레시 토큰 | Refresh Token | 장기 인증 유지를 위한 토큰 | Redis 저장 또는 DB 사용 |
| 마이페이지 | MyPage | 사용자가 자기 정보를 조회/수정하는 화면 | 인증된 사용자 API |

---

## 패키지/클래스 대응 예시

| 한글명 | 클래스 / 패키지 경로 | 역할 |
|--------|----------------------|------|
| 회원 | `domain/User.java` | JPA Entity |
| 회원 컨트롤러 | `controller/UserController.java` | API 진입점 |
| 회원 서비스 | `service/UserService.java` | 비즈니스 로직 |
| JWT 제공자 | `security/JwtProvider.java` | JWT 발급/검증 |
| 인증 DTO | `dto/LoginRequest.java`, `TokenResponse.java` | 요청/응답 데이터 객체 |

---

## 모델링

### 회원
- 회원(User)은 회원 정보를 가진다.
  - 외부에 노출되는 회원명(Name)을 가진다.

---

## 참고 사항

- 유비쿼터스 언어는 `user-service` Bounded Context 내에서 유효합니다.
- 동일한 영어명이 다른 서비스에서 다른 의미를 가질 수 있으므로, 반드시 문맥에 따라 사용해야 합니다.
- 이 문서는 ERD 설계, API 명세서, Swagger, Kafka 메시지 설계 등과 연동됩니다.

