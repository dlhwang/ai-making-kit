
/*
Xiaomi Watch S4 Cardboard Docking Station
하드보드지/폼보드용 파라메트릭 도킹스테이션 설계

권장 뷰어:
- OpenSCAD
- 또는 FreeCAD / MakerWorld / 기타 SCAD 호환 뷰어

단위: mm

핵심 제원:
- Xiaomi Watch S4 본체: 47.3 x 47.3 x 12.0
- 심박 센서 범프 포함 두께: 14.13
- 충전 독: 39.5 x 39.5 x 9.8
- 설계 충전 독 포켓: 40.4 x 40.4 x 10.4
- 하드보드지 두께: 3.0
*/

$fn = 48;

// ===========================
// 0. 사용자 조정 파라미터
// ===========================

mode = "assembly"; 
// "assembly" : 조립 상태 미리보기
// "cut_layout" : 재단 평면도 미리보기
// "front_panel" : 전면 패널만 보기
// "back_panel" : 후면 패널만 보기
// "side_panel" : 측면 패널만 보기
// "base_panel" : 바닥 패널만 보기

board_t = 3.0;

// 실제 기기 제원
watch_diameter = 47.3;
watch_body_thickness = 12.0;
watch_sensor_thickness = 14.13;

charger_w = 39.5;
charger_d = 39.5;
charger_t = 9.8;

// 제작 공차
clearance = 0.45;       // 하드보드지 수작업 절단용 여유
slot_clearance = 0.7;

// 설계 치수
dock_w = 70;
dock_depth = 86;
dock_h = 105;

back_angle = 62;        // 바닥 기준 뒤로 누운 각도. 60~65 권장.
front_lip_h = 18;
front_lip_t = board_t;

charger_pocket_w = charger_w + clearance * 2;
charger_pocket_h = charger_d + clearance * 2;
charger_pocket_depth = charger_t + 0.6;

charger_center_z = 68;  // 바닥에서 충전기 중심 높이
strap_slot_w = 28;
strap_slot_h = 9;
strap_slot_center_z = 42;

cable_hole_d = 12;
cable_channel_w = 7;
cable_channel_bottom_gap = 5;

// 시계 안정화용 얕은 원형 받침 홈
watch_cradle_d = watch_diameter + 1.5;
watch_cradle_depth = 1.0;

// 조립 슬롯
tab_w = 16;
tab_h = 8;
tab_clearance = 0.35;

// ===========================
// 1. 유틸리티
// ===========================

module rounded_rect_2d(w, h, r = 2) {
    hull() {
        translate([r, r]) circle(r);
        translate([w-r, r]) circle(r);
        translate([w-r, h-r]) circle(r);
        translate([r, h-r]) circle(r);
    }
}

module panel_3d(w, h, t = board_t) {
    cube([w, t, h], center=false);
}

module cardboard_color() {
    color([0.70, 0.52, 0.32, 1.0]) children();
}

module cutout_color() {
    color([0.95, 0.95, 0.95, 1.0]) children();
}

module charger_dummy() {
    color([0.15, 0.15, 0.15, 1.0])
        cube([charger_w, charger_t, charger_d], center=true);
}

module watch_dummy() {
    // 실제 시계와 충전기 위치 검증용 더미
    color([0.03, 0.03, 0.03, 0.85])
        translate([0, -watch_sensor_thickness/2 - charger_t/2 - 1, 0])
            cylinder(d=watch_diameter, h=watch_body_thickness, center=true);

    color([0.01, 0.01, 0.01, 0.55]) {
        // 위 스트랩
        translate([0, -watch_sensor_thickness/2 - charger_t/2 - 1, watch_diameter/2 + 32])
            cube([22, 3, 64], center=true);
        // 아래 스트랩
        translate([0, -watch_sensor_thickness/2 - charger_t/2 - 1, -watch_diameter/2 - 38])
            cube([22, 3, 76], center=true);
    }
}

// ===========================
// 2. 전면 기울어진 패널
// ===========================

module front_panel_shape_2d() {
    difference() {
        square([dock_w, dock_h], center=false);

        // 충전 독 사각 포켓 관통 기준선
        translate([
            dock_w/2 - charger_pocket_w/2,
            charger_center_z - charger_pocket_h/2
        ])
            square([charger_pocket_w, charger_pocket_h], center=false);

        // 스트랩 통과 슬롯
        translate([
            dock_w/2 - strap_slot_w/2,
            strap_slot_center_z - strap_slot_h/2
        ])
            rounded_rect_2d(strap_slot_w, strap_slot_h, 2);

        // 하단 조립 탭 슬롯 2개
        translate([13, 0])
            square([tab_w + tab_clearance, tab_h + tab_clearance], center=false);
        translate([dock_w - 13 - tab_w, 0])
            square([tab_w + tab_clearance, tab_h + tab_clearance], center=false);
    }
}

module front_panel_3d() {
    cardboard_color()
    linear_extrude(height=board_t)
        front_panel_shape_2d();
}

// 충전 독이 너무 튀어나오지 않도록, 앞판 뒤쪽에 붙일 포켓 박스
module charger_pocket_box() {
    pocket_outer_w = charger_pocket_w + board_t * 2;
    pocket_outer_h = charger_pocket_h + board_t * 2;

    cardboard_color()
    difference() {
        translate([-pocket_outer_w/2, 0, -pocket_outer_h/2])
            cube([pocket_outer_w, charger_pocket_depth + board_t, pocket_outer_h], center=false);
        translate([-charger_pocket_w/2, -0.1, -charger_pocket_h/2])
            cube([charger_pocket_w, charger_pocket_depth + 0.2, charger_pocket_h], center=false);
    }
}

// ===========================
// 3. 후면 패널: 케이블 구멍/채널
// ===========================

module back_panel_shape_2d() {
    difference() {
        square([dock_w, dock_h], center=false);

        // 케이블 구멍
        translate([dock_w/2, charger_center_z])
            circle(d=cable_hole_d);

        // 케이블 채널
        translate([
            dock_w/2 - cable_channel_w/2,
            cable_channel_bottom_gap
        ])
            rounded_rect_2d(
                cable_channel_w,
                charger_center_z - cable_hole_d/2 - cable_channel_bottom_gap,
                2
            );

        // 하단 조립 탭 슬롯
        translate([13, 0])
            square([tab_w + tab_clearance, tab_h + tab_clearance], center=false);
        translate([dock_w - 13 - tab_w, 0])
            square([tab_w + tab_clearance, tab_h + tab_clearance], center=false);
    }
}

module back_panel_3d() {
    cardboard_color()
    linear_extrude(height=board_t)
        back_panel_shape_2d();
}

// ===========================
// 4. 측면 삼각 지지대
// ===========================

module side_panel_shape_2d() {
    /*
    측면 지지대는 앞판 각도를 잡는 핵심 부품.
    바닥 길이 dock_depth, 높이 dock_h.
    앞쪽 낮은 립/전면 받침과 뒤쪽 등받이를 이어주는 삼각형 구조.
    */
    difference() {
        polygon(points=[
            [0,0],
            [dock_depth,0],
            [dock_depth,dock_h],
            [dock_depth-18,dock_h],
            [16,front_lip_h],
            [0,front_lip_h]
        ]);

        // 무게 줄이기용 삼각 타공, 필수 아님
        polygon(points=[
            [25,24],
            [58,24],
            [58,72]
        ]);

        // 바닥 결합 탭 슬롯
        translate([28, 0])
            square([tab_w + tab_clearance, tab_h + tab_clearance], center=false);
        translate([dock_depth - 35, 0])
            square([tab_w + tab_clearance, tab_h + tab_clearance], center=false);
    }
}

module side_panel_3d() {
    cardboard_color()
    linear_extrude(height=board_t)
        side_panel_shape_2d();
}

// ===========================
// 5. 바닥 패널, 앞 립
// ===========================

module base_panel_3d() {
    cardboard_color()
    cube([dock_w, dock_depth, board_t], center=false);
}

module front_lip_3d() {
    cardboard_color()
    cube([dock_w, board_t, front_lip_h], center=false);
}

// ===========================
// 6. 조립 상태
// ===========================

module assembly() {
    // 바닥
    base_panel_3d();

    // 앞쪽 립
    translate([0, 0, board_t])
        front_lip_3d();

    // 기울어진 전면 패널
    // y-z 평면에 세우기 위해 rotate 후 위치 조정
    translate([0, dock_depth - 8, board_t])
        rotate([back_angle - 90, 0, 0])
            front_panel_3d();

    // 후면 케이블 가이드 패널, 전면 패널과 거의 평행하게 뒤쪽에 배치
    translate([0, dock_depth - 18, board_t])
        rotate([back_angle - 90, 0, 0])
            back_panel_3d();

    // 충전 독 포켓 박스, 전면 패널 뒤쪽
    translate([dock_w/2, dock_depth - 8, board_t])
        rotate([back_angle - 90, 0, 0])
            translate([0, board_t, charger_center_z])
                charger_pocket_box();

    // 좌우 측면 지지대
    translate([0, 0, board_t])
        rotate([90, 0, 90])
            side_panel_3d();

    translate([dock_w, 0, board_t])
        rotate([90, 0, 90])
            side_panel_3d();

    // 충전기 더미
    translate([dock_w/2, dock_depth - 8, board_t])
        rotate([back_angle - 90, 0, 0])
            translate([0, -charger_t/2, charger_center_z])
                charger_dummy();

    // 시계 더미
    translate([dock_w/2, dock_depth - 8, board_t])
        rotate([back_angle - 90, 0, 0])
            translate([0, -charger_t - 2, charger_center_z])
                watch_dummy();
}

// ===========================
// 7. 재단 평면도
// ===========================

module flat_panel(label_text = "") {
    // OpenSCAD 자체 텍스트는 폰트 환경 타서 깨질 수 있어 최소 사용
    children();
}

module cut_layout() {
    gap = 18;

    // 전면 패널
    translate([0,0,0])
        linear_extrude(height=0.6)
            front_panel_shape_2d();

    // 후면 패널
    translate([dock_w + gap, 0, 0])
        linear_extrude(height=0.6)
            back_panel_shape_2d();

    // 좌측 지지대
    translate([0, dock_h + gap, 0])
        linear_extrude(height=0.6)
            side_panel_shape_2d();

    // 우측 지지대
    translate([dock_depth + gap, dock_h + gap, 0])
        linear_extrude(height=0.6)
            mirror([1,0,0])
                side_panel_shape_2d();

    // 바닥 패널
    translate([dock_w*2 + gap*2, 0, 0])
        linear_extrude(height=0.6)
            square([dock_w, dock_depth], center=false);

    // 앞 립
    translate([dock_w*2 + gap*2, dock_depth + gap, 0])
        linear_extrude(height=0.6)
            square([dock_w, front_lip_h], center=false);
}

// ===========================
// 8. 모드 선택
// ===========================

if (mode == "assembly") {
    assembly();
} else if (mode == "cut_layout") {
    cut_layout();
} else if (mode == "front_panel") {
    front_panel_3d();
} else if (mode == "back_panel") {
    back_panel_3d();
} else if (mode == "side_panel") {
    side_panel_3d();
} else if (mode == "base_panel") {
    base_panel_3d();
}
