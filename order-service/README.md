# 유비쿼터스 언어 정의서 - 주문 도메인 (`order-service`)

## 목적
주문 관련 도메인 용어를 명확하게 정의하고, 타 서비스와 일관된 인터페이스를 유지한다.

---

## 용어 정의

| 한글 용어 | 영문명(Key Name) | 설명 |
|-----------|------------------|------|
| 주문 | order | 사용자의 구매 행위 |
| 주문 ID | orderId | 주문 식별값 |
| 주문 항목 | orderItem | 주문에 포함된 상품 단위 |
| 상품 ID | productId | 주문 항목에 포함된 상품 ID |
| 수량 | quantity | 주문한 상품의 개수 |
| 항목 금액 | price | 개별 주문 항목의 금액 |
| 총 주문 금액 | totalPrice | 모든 주문 항목의 합산 금액 |
| 주문 상태 | status | CREATED, PAID, CANCELED 등 |
| 주문일 | createdAt | 주문 생성 시각 |
| 사용자 ID | userId | 주문을 요청한 회원 식별자 |

---

## 사용 규칙

- 결제 서비스로 주문 ID(`orderId`)와 금액(`totalPrice`)를 전달한다.
- Kafka 이벤트 또는 Feign 요청 시 동일한 명명 규칙을 따른다.
