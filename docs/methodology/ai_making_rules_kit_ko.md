# AI-MAKING Rules Kit 설명서

`ai-making-rules`와 `ai-making-rule-details`는 CAD, 종이/하드보드 모델, 레이저 커팅, 3D 프린팅, 지그, 거치대, 케이스처럼 실제 물건을 만드는 프로젝트를 위한 워크플로 키트입니다.

이 키트의 목적은 아이디어나 CAD 파일을 바로 제작 가능한 패키지로 발전시키는 것입니다.

## 생성되는 폴더

```text
ai-making-rules/
ai-making-rule-details/
```

## 핵심 질문

AI-MAKING은 어떤 제작 프로젝트에서도 아래 질문을 빠뜨리지 않게 만듭니다.

- 무엇을 만들 것인가?
- 누가 만들고 누가 사용할 것인가?
- 어떤 재료를 쓸 것인가?
- 어떤 공법으로 만들 것인가?
- 어떤 치수를 실제로 측정해야 하는가?
- 어느 정도 공차와 여유가 필요한가?
- 전체 제작 전에 어떤 테스트 쿠폰을 만들 것인가?
- 초보자도 만들 수 있게 설명되어 있는가?
- 최종 제작 패키지에는 무엇이 들어가야 하는가?

## 사용법

프로젝트 루트에 다음 폴더를 둡니다.

```text
ai-making-rules/
ai-making-rule-details/
```

그리고 AI에게 이렇게 요청합니다.

```text
ai-making-rules/core-workflow.md를 읽고 이 설계 프로젝트를 진행하시오.
```

## 산출물 위치

AI-MAKING workflow는 기본적으로 프로젝트 안에 다음 폴더를 만듭니다.

```text
making-docs/
```

필수 추적 파일:

```text
making-docs/making-state.md
making-docs/audit.md
```

## 권장 최종 패키지

완성도 높은 제작 프로젝트는 보통 아래 산출물을 포함합니다.

```text
source CAD
fabrication exports
test coupon
assembly guide
measured specs
validation report
known risks
changelog
release package index
```

## 제작 품질 게이트

```text
Gate 0 문제 정의
Gate 1 재료/공법 결정
Gate 2 측정 계획과 실제 측정
Gate 3 설계 구조 검토
Gate 4 CAD 출력 검증
Gate 5 테스트 쿠폰 통과
Gate 6 1차 프로토타입 통과
Gate 7 초보자 제작성 검토
Gate 8 최종 패키지 검토
```

