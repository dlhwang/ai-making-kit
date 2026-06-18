# Engineering Making Methodology

이 폴더는 CAD/설계도 기반 메이킹 프로젝트를 실제 제작 가능한 패키지로 발전시키기 위한 범용 방법론입니다.

## 문서 목록

1. [공학적 메이킹 워크플로우](engineering_making_workflow_ko.md)
2. [공학적 메이킹 체크리스트](engineering_making_checklists_ko.md)
3. [공학적 메이킹 품질 게이트](engineering_making_quality_gates_ko.md)
4. [공학적 메이킹 산출물 템플릿](engineering_making_artifact_templates_ko.md)

## 기본 흐름

```text
목적 정의
-> 사용자/사용 장면 정의
-> 재료/공법 확정
-> 실측
-> 기능 구조 설계
-> 제작 구조 설계
-> CAD/도면 작성
-> 테스트 쿠폰
-> 1차 프로토타입
-> fit/use 검증
-> 초보자용 문서화
-> 최종 제작 패키지
```

## 핵심 판단

설계 파일만 있으면 제작 가능한 것이 아닙니다.

제작 가능한 설계에는 다음이 함께 있어야 합니다.

- 실측값
- 재료/공법 기준
- 테스트 쿠폰
- 조립 순서
- 부품 번호와 수량
- 접착/체결 위치
- 검증 결과
- 실패 시 조정 방법

## 적용 대상

- OpenSCAD 설계
- 2D 레이저 커팅 도면
- 하드보드지/종이/아크릴/합판 제작
- 3D 프린팅 프로젝트
- 전자기기 거치대, 케이스, 지그, 공구 보조물
- 초보자용 제작 키트

