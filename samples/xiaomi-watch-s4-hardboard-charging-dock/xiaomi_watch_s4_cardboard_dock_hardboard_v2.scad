/*
Xiaomi Watch S4 hardboard/cardboard charging dock V2.

This file is a new fabrication-oriented variant inspired by
xiaomi_watch_s4_cardboard_dock_hardboard.scad. The original files are
preserved.

Units: mm

View modes:
  0 assembly
  1 cut_layout_2d
  2 cut_layout_preview
  3 front_panel
  4 rear_panel
  5 side_panel
  6 base_panel
  7 fit_check
  8 test_coupon_2d
  9 beginner_cut_layout_2d
 10 exploded_preview
*/

$fn = 64;

view_mode = 0;

// ----- Material and fabrication parameters -----

sheet_t = 1.5;
wall_layers = 2;
base_layers = 3;
face_t = sheet_t * wall_layers;
base_t = sheet_t * base_layers;

// Tune these after cutting the test coupon.
kerf = 0.20;
slot_fit = 0.45;
charger_fit = 0.70;
glue_gap = 0.25;

// ----- Device assumptions, not measured in this session -----

watch_d = 47.3;
watch_body_t = 12.0;

charger_w = 39.5;
charger_h = 39.5;
charger_t = 9.8;
charger_corner_r = 4.0;

cable_d = 4.0;

// ----- Dock envelope -----

dock_w = 78;
dock_depth = 102;
dock_h = 116;

panel_angle = 64;
panel_tilt = panel_angle - 90;

front_plane_y = dock_depth - 16;
rear_plane_y = dock_depth - 32;

charger_center_z = 74;
strap_slot_w = 34;
strap_slot_h = 13;
strap_slot_center_z = 42;

front_lip_h = 16;
front_lip_y = 7;

cable_hole_d = max(14, cable_d + 9);
cable_channel_w = max(10, cable_d + 5);
cable_bend_w = 26;
cable_bend_h = 16;

tab_w = 18;
tab_h = 10;
tab_slot_w = tab_w + slot_fit;
tab_slot_h = face_t + slot_fit;

brace_w = dock_w - 16;
brace_h = 16;

layout_gap = 16;

// ----- Utility -----

module rounded_rect_2d(w, h, r = 2) {
    rr = min(r, min(w, h) / 2);
    hull() {
        translate([rr, rr]) circle(r = rr);
        translate([w - rr, rr]) circle(r = rr);
        translate([w - rr, h - rr]) circle(r = rr);
        translate([rr, h - rr]) circle(r = rr);
    }
}

module centered_rounded_rect_2d(w, h, r = 2) {
    translate([-w / 2, -h / 2])
        rounded_rect_2d(w, h, r);
}

module sheet_color() {
    color([0.66, 0.47, 0.28, 1.0]) children();
}

module glue_color() {
    color([0.84, 0.67, 0.42, 1.0]) children();
}

module guide_color() {
    color([0.74, 0.56, 0.33, 1.0]) children();
}

module part_color(i = 0) {
    colors = [
        [0.66, 0.47, 0.28, 1.0],
        [0.78, 0.58, 0.34, 1.0],
        [0.58, 0.41, 0.25, 1.0],
        [0.88, 0.70, 0.44, 1.0]
    ];
    color(colors[i % len(colors)]) children();
}

module local_plate(t = face_t) {
    rotate([90, 0, 0])
        linear_extrude(height = t)
            children();
}

module preview_plate(t = sheet_t) {
    linear_extrude(height = t)
        children();
}

// ----- 2D part profiles -----

module charger_opening_2d(extra = 0) {
    centered_rounded_rect_2d(
        charger_w + charger_fit * 2 + extra,
        charger_h + charger_fit * 2 + extra,
        charger_corner_r + extra / 2
    );
}

module front_panel_2d() {
    difference() {
        rounded_rect_2d(dock_w, dock_h, 2);

        translate([dock_w / 2, charger_center_z])
            charger_opening_2d();

        translate([
            dock_w / 2 - strap_slot_w / 2,
            strap_slot_center_z - strap_slot_h / 2
        ])
            rounded_rect_2d(strap_slot_w, strap_slot_h, 4);

        // Thumb relief for removing the charger during tuning.
        translate([dock_w / 2 - 13, charger_center_z - 35])
            rounded_rect_2d(26, 11, 4);

        // Tiny top relief keeps the watch strap from rubbing a sharp corner.
        translate([dock_w / 2 - 15, charger_center_z + 30])
            rounded_rect_2d(30, 9, 4);
    }
}

module rear_panel_2d() {
    difference() {
        rounded_rect_2d(dock_w, dock_h, 2);

        translate([dock_w / 2, charger_center_z])
            circle(d = cable_hole_d);

        translate([dock_w / 2 - cable_channel_w / 2, 7])
            rounded_rect_2d(
                cable_channel_w,
                charger_center_z - cable_hole_d / 2 - 7,
                3
            );

        translate([
            dock_w / 2 - cable_bend_w / 2,
            charger_center_z - cable_bend_h / 2
        ])
            rounded_rect_2d(cable_bend_w, cable_bend_h, 5);
    }
}

module base_panel_2d() {
    difference() {
        rounded_rect_2d(dock_w, dock_depth, 3);

        for (x = [face_t + 5, dock_w - face_t - 5 - tab_slot_h]) {
            for (y = [24, 70]) {
                translate([x, y])
                    rounded_rect_2d(tab_slot_h, tab_slot_w, 1.5);
            }
        }

        // Shallow rear cable exit reference. Enlarge by hand only after fit test.
        translate([dock_w / 2 - cable_channel_w / 2, dock_depth - 18])
            rounded_rect_2d(cable_channel_w, 16, 3);
    }
}

module side_panel_outline_2d() {
    polygon(points = [
        [0, 0],
        [dock_depth, 0],
        [dock_depth, dock_h],
        [dock_depth - 19, dock_h],
        [19, front_lip_h + 3],
        [0, front_lip_h + 3]
    ]);
}

module side_panel_tabs_2d() {
    translate([24, -tab_h])
        rounded_rect_2d(tab_w, tab_h + 0.1, 1.5);
    translate([70, -tab_h])
        rounded_rect_2d(tab_w, tab_h + 0.1, 1.5);
}

module side_panel_2d(lightened = true) {
    difference() {
        union() {
            side_panel_outline_2d();
            side_panel_tabs_2d();
        }

        if (lightened) {
            polygon(points = [
                [32, 31],
                [66, 31],
                [66, 82]
            ]);
        }

        // Rear cable viewing notch, not a load-bearing interface.
        translate([dock_depth - 16, 18])
            rounded_rect_2d(10, 30, 3);
    }
}

module front_lip_2d() {
    rounded_rect_2d(dock_w, front_lip_h, 2);
}

module lower_brace_2d() {
    difference() {
        rounded_rect_2d(brace_w, brace_h, 2);
        translate([brace_w / 2 - cable_channel_w / 2, 2])
            rounded_rect_2d(cable_channel_w, brace_h - 4, 3);
    }
}

module charger_spacer_ring_2d() {
    difference() {
        translate([dock_w / 2, charger_center_z])
            charger_opening_2d(extra = face_t * 2 + 3);
        translate([dock_w / 2, charger_center_z])
            charger_opening_2d();
    }
}

module watch_saddle_2d() {
    intersection() {
        difference() {
            translate([dock_w / 2, charger_center_z])
                circle(d = watch_d + 10);
            translate([dock_w / 2, charger_center_z])
                circle(d = watch_d + 2.5);
        }
        translate([dock_w / 2 - (watch_d + 16) / 2, charger_center_z - 36])
            square([watch_d + 16, 30], center = false);
    }
}

module rear_retainer_2d() {
    difference() {
        rounded_rect_2d(charger_w + 18, 18, 3);
        translate([(charger_w + 18) / 2, 9])
            circle(d = cable_hole_d);
    }
}

module angle_gauge_2d() {
    gauge_w = 62;
    gauge_h = gauge_w * tan(90 - panel_angle);
    difference() {
        polygon(points = [
            [0, 0],
            [gauge_w, 0],
            [gauge_w, gauge_h]
        ]);
        translate([8, 6])
            rounded_rect_2d(20, 8, 2);
    }
}

module glue_spreader_2d() {
    rounded_rect_2d(58, 11, 2);
}

// ----- 3D fabrication parts -----

module front_panel_3d() {
    sheet_color()
        local_plate(face_t)
            front_panel_2d();
}

module rear_panel_3d() {
    sheet_color()
        local_plate(face_t)
            rear_panel_2d();
}

module side_panel_3d(lightened = true) {
    sheet_color()
        local_plate(face_t)
            side_panel_2d(lightened);
}

module base_panel_3d() {
    sheet_color()
        linear_extrude(height = base_t)
            base_panel_2d();
}

module front_lip_3d() {
    glue_color()
        translate([0, front_lip_y, base_t])
            cube([dock_w, face_t, front_lip_h], center = false);
}

module lower_brace_3d() {
    glue_color()
        local_plate(face_t)
            lower_brace_2d();
}

module charger_spacer_ring_3d() {
    guide_color()
        local_plate(face_t * 2)
            charger_spacer_ring_2d();
}

module watch_saddle_3d() {
    guide_color()
        local_plate(face_t)
            watch_saddle_2d();
}

module rear_retainer_3d() {
    glue_color()
        local_plate(face_t)
            rear_retainer_2d();
}

module on_front_plane() {
    translate([0, front_plane_y, base_t])
        rotate([panel_tilt, 0, 0])
            children();
}

module on_rear_plane() {
    translate([0, rear_plane_y, base_t])
        rotate([panel_tilt, 0, 0])
            children();
}

module charger_dummy() {
    color([0.08, 0.08, 0.08, 1.0])
        translate([dock_w / 2, -face_t - charger_t / 2 + 0.5, charger_center_z])
            cube([charger_w, charger_t, charger_h], center = true);
}

module watch_dummy() {
    color([0.02, 0.02, 0.02, 0.72])
        translate([dock_w / 2, -face_t - charger_t - watch_body_t / 2, charger_center_z])
            rotate([90, 0, 0])
                cylinder(d = watch_d, h = watch_body_t, center = true);

    color([0.02, 0.02, 0.02, 0.36]) {
        translate([dock_w / 2, -face_t - charger_t - 8, charger_center_z + watch_d / 2 + 30])
            cube([24, 3, 60], center = true);
        translate([dock_w / 2, -face_t - charger_t - 8, charger_center_z - watch_d / 2 - 36])
            cube([24, 3, 72], center = true);
    }
}

// ----- Assemblies -----

module assembly() {
    base_panel_3d();
    front_lip_3d();

    on_front_plane() {
        front_panel_3d();
        translate([0, -face_t - glue_gap, 0])
            charger_spacer_ring_3d();
        translate([0, -face_t * 2 - glue_gap * 2, 0])
            watch_saddle_3d();
        charger_dummy();
        watch_dummy();
    }

    on_rear_plane() {
        rear_panel_3d();
        translate([dock_w / 2 - (charger_w + 18) / 2, -face_t - glue_gap, charger_center_z - 9])
            rear_retainer_3d();
        translate([(dock_w - brace_w) / 2, -face_t - glue_gap, 18])
            lower_brace_3d();
    }

    translate([0, 0, base_t])
        rotate([90, 0, 90])
            side_panel_3d(true);

    translate([dock_w, 0, base_t])
        rotate([90, 0, 90])
            side_panel_3d(true);
}

module fit_check() {
    on_front_plane() {
        front_panel_3d();
        translate([0, -face_t - glue_gap, 0])
            charger_spacer_ring_3d();
        translate([0, -face_t * 2 - glue_gap * 2, 0])
            watch_saddle_3d();
        charger_dummy();
        watch_dummy();
    }

    on_rear_plane() {
        rear_panel_3d();
        translate([dock_w / 2 - (charger_w + 18) / 2, -face_t - glue_gap, charger_center_z - 9])
            rear_retainer_3d();
    }
}

module exploded_preview() {
    base_panel_3d();

    translate([0, -18, 0])
        front_lip_3d();

    translate([-34, 0, 0])
        rotate([90, 0, 90])
            side_panel_3d(true);

    translate([dock_w + 34, 0, 0])
        rotate([90, 0, 90])
            side_panel_3d(true);

    translate([0, front_plane_y + 18, base_t])
        rotate([panel_tilt, 0, 0])
            front_panel_3d();

    translate([0, rear_plane_y - 18, base_t])
        rotate([panel_tilt, 0, 0])
            rear_panel_3d();
}

// ----- Cut layouts -----

module common_cut_layout_2d(lightened_sides = true, helpers = false) {
    for (i = [0 : wall_layers - 1]) {
        translate([i * (dock_w + layout_gap), 0])
            front_panel_2d();
        translate([i * (dock_w + layout_gap), dock_h + layout_gap])
            rear_panel_2d();
    }

    for (i = [0 : wall_layers - 1]) {
        translate([wall_layers * (dock_w + layout_gap) + i * (dock_depth + layout_gap), 0])
            side_panel_2d(lightened_sides);
        translate([wall_layers * (dock_w + layout_gap) + i * (dock_depth + layout_gap), dock_h + layout_gap])
            mirror([1, 0])
                side_panel_2d(lightened_sides);
    }

    for (i = [0 : base_layers - 1]) {
        translate([0, (dock_h + layout_gap) * 2 + i * (dock_depth + layout_gap)])
            base_panel_2d();
    }

    x_aux = dock_w + layout_gap;
    y_aux = (dock_h + layout_gap) * 2;

    translate([x_aux, y_aux])
        front_lip_2d();
    translate([x_aux, y_aux + front_lip_h + layout_gap])
        charger_spacer_ring_2d();
    translate([x_aux, y_aux + front_lip_h + layout_gap + 60])
        watch_saddle_2d();
    translate([x_aux, y_aux + front_lip_h + layout_gap + 112])
        rear_retainer_2d();
    translate([x_aux, y_aux + front_lip_h + layout_gap + 148])
        lower_brace_2d();

    if (helpers) {
        translate([dock_w * 2 + layout_gap * 2, y_aux])
            angle_gauge_2d();
        translate([dock_w * 2 + layout_gap * 2, y_aux + 52])
            glue_spreader_2d();
    }
}

module cut_layout_2d() {
    common_cut_layout_2d(true, false);
}

module beginner_cut_layout_2d() {
    // Beginner layout keeps side panels solid and includes helper pieces.
    common_cut_layout_2d(false, true);
}

module cut_layout_preview() {
    for (i = [0 : 3]) {
        part_color(i)
            translate([0, 0, i * (sheet_t + 0.25)])
                preview_plate(sheet_t)
                    cut_layout_2d();
    }
}

module test_coupon_2d() {
    // Cut before the full layout. Update sheet_t, slot_fit, charger_fit,
    // cable_channel_w, and kerf from the results.
    translate([0, 0]) {
        difference() {
            rounded_rect_2d(46, 34, 3);
            translate([10, 8])
                rounded_rect_2d(tab_slot_h, tab_slot_w, 1.5);
            translate([27, 8])
                rounded_rect_2d(tab_slot_h + 0.4, tab_slot_w + 0.4, 1.5);
        }
    }

    translate([60, 0])
        rounded_rect_2d(tab_w, tab_h, 2);

    translate([96, 0]) {
        difference() {
            rounded_rect_2d(58, 58, 3);
            translate([29, 29])
                charger_opening_2d();
        }
    }

    translate([0, 50])
        rounded_rect_2d(strap_slot_w, strap_slot_h, 4);

    translate([60, 50])
        rounded_rect_2d(cable_channel_w, 44, 3);

    translate([96, 72])
        angle_gauge_2d();

    translate([0, 78])
        lower_brace_2d();
}

// ----- View selection -----

if (view_mode == 0) {
    assembly();
} else if (view_mode == 1) {
    cut_layout_2d();
} else if (view_mode == 2) {
    cut_layout_preview();
} else if (view_mode == 3) {
    front_panel_3d();
} else if (view_mode == 4) {
    rear_panel_3d();
} else if (view_mode == 5) {
    side_panel_3d(true);
} else if (view_mode == 6) {
    base_panel_3d();
} else if (view_mode == 7) {
    fit_check();
} else if (view_mode == 8) {
    test_coupon_2d();
} else if (view_mode == 9) {
    beginner_cut_layout_2d();
} else if (view_mode == 10) {
    exploded_preview();
}
