# 패키지 구조
```
📂msa-ecommerce-platform/
├── user-service/                # 회원 관리, JWT 인증/인가
│   └── src/main/java/com/example/userservice
├── order-service/               # 주문 처리 (Kafka producer)
├── payment-service/             # 결제 처리 (Kafka consumer)
├── api-gateway/                 # Spring Cloud Gateway (라우팅, 인증 연계)
├── config-service/              # Spring Cloud Config Server
├── discovery-service/           # Eureka 서비스 등록소
├── auth-service/                # (선택) OAuth2 인증 서버 (Spring Authorization Server)
├── common-lib/                  # (선택) 공통 DTO, 응답 포맷, 예외 핸들링
│   └── build.gradle → jar 로 export
├── infra/
│   ├── monitoring/              # Prometheus + Grafana 구성 (선택)
│   ├── redis/                   # Redis 설정 (K8s YAML, Docker 설정)
│   ├── kafka/                   # Kafka 설정
├── k8s/                         # Kubernetes 리소스 정의
│   ├── user-deployment.yaml
│   ├── order-deployment.yaml
│   ├── redis-deployment.yaml
│   ├── kafka-deployment.yaml
│   ├── ingress.yaml
│   └── namespace.yaml
├── docker-compose.yml          # 로컬 개발 환경 통합
├── .github/workflows/          # GitHub Actions (서비스별 CI/CD 가능)
│   ├── user-deploy.yml
│   └── gateway-deploy.yml
├── docs/                        # API 명세서, 시퀀스 다이어그램, ERD 등
│   ├── architecture-diagram.png
│   └── user-api-spec.md
├── README.md                    # 전체 프로젝트 문서화

* 목표로 하는 패키지 구조
```

