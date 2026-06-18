# AI-MAKING Rules Kit 설명서

## 목적

`ai-making-rules`와 `ai-making-rule-details`는 설계도와 공학적 메이킹 프로젝트를 위한 전용 workflow kit입니다.

이 키트는 어떤 프로젝트라도 다음 질문을 반드시 지나가게 만듭니다.

- 무엇을 만들 것인가?
- 누가 만들고 누가 사용할 것인가?
- 어떤 재료와 공법인가?
- 어떤 치수를 실측해야 하는가?
- 어떤 tolerance와 fit 위험이 있는가?
- 전체 제작 전 어떤 test coupon을 만들 것인가?
- 초보자도 만들 수 있는가?
- 최종 패키지에 무엇이 들어가야 하는가?

## 생성된 폴더

```text
ai-making-rules/
ai-making-rule-details/
```

## 기존 AI-BLC와의 차이

| 구분 | AI-BLC | AI-MAKING |
| --- | --- | --- |
| 목적 | 실무/문서/운영 워크플로우 | 물리 제작/설계 워크플로우 |
| 핵심 산출물 | 계획, 보고서, 운영 문서 | CAD, 도면, test coupon, 조립 가이드 |
| 필수 고려 | 이해관계자, 승인, 운영 | 재료, 공법, 실측, tolerance |
| 검증 기준 | 요구사항/품질/운영성 | 제작 가능성/fit/사용성/초보자 완성 가능성 |

## 사용법

프로젝트 루트에 다음 두 폴더를 둡니다.

```text
ai-making-rules/
ai-making-rule-details/
```

그리고 다음처럼 요청합니다.

```text
ai-making-rules/core-workflow.md를 읽고 이 CAD 설계를 제작 가능한 패키지로 발전시켜라.
```

## 산출물 위치

AI-MAKING workflow는 기본적으로 다음 폴더를 사용합니다.

```text
making-docs/
```

필수 추적 파일:

```text
making-docs/making-state.md
making-docs/audit.md
```

## 권장 최종 패키지

```text
source.scad or source CAD
cut_layout.dxf
novice_cut_layout.dxf
test_coupon.dxf
assembly_guide.md
measured_specs.md
validation_report.md
known_risks.md
changelog.md
release_package_index.md
```

## 이 키트가 강제하는 핵심 게이트

```text
Gate 0 문제 정의
Gate 1 재료/공법 확정
Gate 2 실측 완료
Gate 3 제작 구조 검토
Gate 4 CAD 출력 검증
Gate 5 테스트 쿠폰 통과
Gate 6 1차 프로토타입 통과
Gate 7 초보자 제작성 통과
Gate 8 최종 패키지 통과
```

