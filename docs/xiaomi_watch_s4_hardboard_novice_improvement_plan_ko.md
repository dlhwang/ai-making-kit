# Xiaomi Watch S4 하드보드지 도크 - 초보자용 개선 계획

## 목표

현재 설계를 “공학적 CAD”에서 “신입생도 완성 가능한 제작 키트”로 낮춘다.

목표 난이도:

```text
현재: 7.5 / 10
1차 보완 후: 4.5 / 10
2차 보완 후: 3 / 10
```

## 1차 보완: 반드시 먼저 할 것

상태: 완료.

### 1. Test Coupon 모드 추가

SCAD에 다음 모드를 추가합니다.

```text
8 test_coupon_2d
```

구현 완료: `xiaomi_watch_s4_cardboard_dock_hardboard.scad`

포함할 샘플:

- base slot 1개
- side tab 1개
- charger rounded corner sample
- strap slot sample
- cable channel sample

목적:

- 전체 부품을 자르기 전에 실제 하드보드지와 칼/커터/레이저 조건을 확인합니다.
- 초보자가 첫 시도에서 전체 재료를 망치는 것을 막습니다.

### 2. Assembly Guide 작성

새 문서:

```text
docs/xiaomi_watch_s4_hardboard_assembly_guide_ko.md
```

작성 완료.

포함할 내용:

- 필요한 도구
- 부품 목록
- 부품별 적층 수
- 접착 순서
- 건조/압착 방법
- 충전기 삽입 순서
- 케이블 정리
- 최종 fit 조정

### 3. Part ID 표 만들기

부품 번호 체계:

```text
A1/A2: front panel layers
B1/B2: back panel layers
C1/C2: left side layers
D1/D2: right side layers
E1/E2/E3: base layers
F: front lip
G: charger spacer ring
H: watch saddle
I: rear retainer
```

DXF 안에 글자를 직접 넣기보다 문서와 출력물의 위치 기준으로 설명합니다.

### 4. 손절단 난이도 낮추기

초보자/손절단용 모드:

```text
9 novice_cut_layout_2d
```

구현 완료: 사이드 패널 내부 경량화 구멍을 제거하고 보조 게이지를 추가했습니다.

변경:

- side panel 내부 lightening cutout 제거
- 너무 얇은 ring 부품은 조금 두껍게
- sharp 내부 코너 최소화
- 부품 간 간격 확대

## 2차 보완: 성공률을 더 높이는 것

### 1. Alignment Template 추가

전면/후면 패널 위치를 잡는 기준 템플릿을 추가합니다.

목적:

- 초보자가 패널 각도와 위치를 감으로 맞추지 않게 합니다.

### 2. Angle Gauge 추가

`panel_angle = 64`에 맞는 단순 삼각 각도 게이지를 절단 레이아웃에 넣습니다.

목적:

- 접착 중 전면 패널과 후면 패널 기울기를 유지합니다.

### 3. Glue Area 표시

SCAD에서 실제 glue marking을 선으로 넣기 어렵다면 조립 문서에서 다음을 명확히 표시합니다.

- 베이스와 side frame 접착면
- front panel 접착면
- back panel 접착면
- spacer ring 접착면
- saddle 접착면
- rear retainer 접착면

## 3차 보완: 실사용 품질 개선

### 1. Charger Retainer 개선

현재 rear retainer는 기본 형상입니다.

추후 개선:

- 슬라이드식 retainer
- 교체 가능한 retainer
- 테이프/고무줄 없이 고정되는 구조

### 2. Base Stability 개선

추후 개선:

- 바닥 확장 옵션
- 무게추 삽입 공간
- 미끄럼 방지 패드 위치 표시

### 3. Cable Exit 옵션

추후 개선:

- 아래 방향 cable exit
- 뒤 방향 cable exit
- 좌/우 방향 cable exit

## 권장 작업 순서

1. `test_coupon_2d` 구현
2. `assembly_guide_ko.md` 작성
3. `novice_cut_layout_2d` 구현
4. `angle_gauge_2d` 또는 alignment template 구현
5. OpenSCAD CLI 검증
6. 테스트 쿠폰 절단
7. 전체 절단

## 완료 기준

초보자용 버전은 다음 조건을 만족해야 합니다.

- 사용자가 어떤 부품이 무엇인지 알 수 있다.
- 같은 모양을 몇 장 겹치는지 알 수 있다.
- 풀칠 위치를 알 수 있다.
- 전면/후면 패널 각도를 맞출 방법이 있다.
- 전체 절단 전에 작은 테스트를 할 수 있다.
- 충전기 fit이 안 맞을 때 어디를 조정해야 하는지 알 수 있다.
