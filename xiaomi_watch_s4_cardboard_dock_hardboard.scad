/*
Xiaomi Watch S4 hardboard-paper charging dock.

This is a clean fabrication-oriented revision. The original
xiaomi_watch_s4_cardboard_dock.scad is preserved as source context.

Units: mm

View modes:
  0 assembly
  1 cut_layout_2d
  2 cut_layout_preview
  3 front_panel
  4 back_panel
  5 side_panel
  6 base_panel
  7 fit_check
  8 test_coupon_2d
  9 novice_cut_layout_2d
*/

$fn = 64;

view_mode = 0;

// Material is built by stacking hardboard sheets.
sheet_t = 1.5;
wall_layers = 2;
base_layers = 3;
wall_t = sheet_t * wall_layers;
base_t = sheet_t * base_layers;

// Fabrication fit assumptions. Measure and tune after a test coupon.
kerf = 0.2;
slot_fit = 0.45;
glue_gap = 0.25;

// Device assumptions from the original design.
watch_d = 47.3;
watch_body_t = 12.0;
watch_sensor_allowance = 14.13;

charger_w = 39.5;
charger_h = 39.5;
charger_t = 9.8;
charger_corner_r = 4.0;
charger_clearance = 0.65;
charger_face_offset = 0.5;

// Dock envelope, enlarged slightly for hardboard margins and easier use.
dock_w = 76;
dock_depth = 96;
dock_h = 112;
panel_angle = 64;
panel_tilt = panel_angle - 90;

front_panel_y = dock_depth - 14;
back_panel_y = dock_depth - 28;

charger_center_z = 72;
strap_slot_w = 32;
strap_slot_h = 12;
strap_slot_center_z = 42;

cable_d = 4.0;
cable_channel_w = max(9, cable_d + 4);
cable_hole_d = 14;
cable_bend_clearance = 12;

front_lip_h = 14;
front_lip_y = 6;

tab_w = 18;
tab_h = 9;
tab_slot_w = tab_w + slot_fit;
tab_slot_h = wall_t + slot_fit;

layout_gap = 16;

// ---------- Utility ----------

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
    color([0.68, 0.48, 0.27, 1.0]) children();
}

module glue_face_color() {
    color([0.82, 0.66, 0.42, 1.0]) children();
}

module guide_color() {
    color([0.78, 0.58, 0.32, 1.0]) children();
}

module local_plate(t = wall_t) {
    rotate([90, 0, 0])
        linear_extrude(height = t)
            children();
}

module preview_plate(t = sheet_t) {
    linear_extrude(height = t)
        children();
}

// ---------- 2D part profiles ----------

module charger_opening_2d(extra = 0) {
    centered_rounded_rect_2d(
        charger_w + charger_clearance * 2 + extra,
        charger_h + charger_clearance * 2 + extra,
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

        // Finger relief for pulling the cable/charger during fitting.
        translate([dock_w / 2 - 11, charger_center_z - 33])
            rounded_rect_2d(22, 10, 4);
    }
}

module back_panel_2d() {
    difference() {
        rounded_rect_2d(dock_w, dock_h, 2);

        translate([dock_w / 2, charger_center_z])
            circle(d = cable_hole_d);

        translate([
            dock_w / 2 - cable_channel_w / 2,
            6
        ])
            rounded_rect_2d(
                cable_channel_w,
                charger_center_z - cable_hole_d / 2 - 6,
                3
            );

        // Rear bend relief. This avoids a sharp cable kink.
        translate([
            dock_w / 2 - (cable_bend_clearance + cable_channel_w) / 2,
            charger_center_z - cable_bend_clearance / 2
        ])
            rounded_rect_2d(
                cable_bend_clearance + cable_channel_w,
                cable_bend_clearance,
                4
            );
    }
}

module base_panel_2d() {
    difference() {
        rounded_rect_2d(dock_w, dock_depth, 3);

        // Registration slots for side-frame tabs.
        for (x = [wall_t + 5, dock_w - wall_t - 5 - tab_slot_h]) {
            for (y = [24, 66]) {
                translate([x, y])
                    rounded_rect_2d(tab_slot_h, tab_slot_w, 1.5);
            }
        }
    }
}

module front_lip_2d() {
    rounded_rect_2d(dock_w, front_lip_h, 2);
}

module side_panel_2d() {
    difference() {
        union() {
            polygon(points = [
                [0, 0],
                [dock_depth, 0],
                [dock_depth, dock_h],
                [dock_depth - 18, dock_h],
                [18, front_lip_h + 2],
                [0, front_lip_h + 2]
            ]);

            // Large base tabs. Glue carries load; tabs locate the panel.
            translate([24, -tab_h])
                rounded_rect_2d(tab_w, tab_h + 0.1, 1.5);
            translate([66, -tab_h])
                rounded_rect_2d(tab_w, tab_h + 0.1, 1.5);
        }

        // Lightening cutout. Keep generous bridges for hardboard strength.
        polygon(points = [
            [30, 28],
            [62, 28],
            [62, 76]
        ]);
    }
}

module novice_side_panel_2d() {
    union() {
        polygon(points = [
            [0, 0],
            [dock_depth, 0],
            [dock_depth, dock_h],
            [dock_depth - 18, dock_h],
            [18, front_lip_h + 2],
            [0, front_lip_h + 2]
        ]);

        translate([24, -tab_h])
            rounded_rect_2d(tab_w, tab_h + 0.1, 2);
        translate([66, -tab_h])
            rounded_rect_2d(tab_w, tab_h + 0.1, 2);
    }
}

module charger_spacer_ring_2d() {
    difference() {
        translate([dock_w / 2, charger_center_z])
            charger_opening_2d(extra = wall_t * 2 + 2);
        translate([dock_w / 2, charger_center_z])
            charger_opening_2d(extra = 0);
    }
}

module watch_saddle_2d() {
    // Lower horseshoe guide. It supports the watch but leaves the top open.
    intersection() {
        difference() {
            translate([dock_w / 2, charger_center_z])
                circle(d = watch_d + 9);
            translate([dock_w / 2, charger_center_z])
                circle(d = watch_d + 2);
        }
        translate([dock_w / 2 - (watch_d + 14) / 2, charger_center_z - 34])
            square([watch_d + 14, 28], center = false);
    }
}

module rear_retainer_2d() {
    difference() {
        rounded_rect_2d(charger_w + 16, 16, 3);
        translate([(charger_w + 16) / 2, 8])
            circle(d = cable_hole_d);
    }
}

module angle_gauge_2d() {
    gauge_w = 58;
    gauge_h = gauge_w * tan(90 - panel_angle);
    difference() {
        polygon(points = [
            [0, 0],
            [gauge_w, 0],
            [gauge_w, gauge_h]
        ]);
        translate([8, 6])
            rounded_rect_2d(18, 7, 2);
    }
}

module glue_spreader_2d() {
    rounded_rect_2d(52, 10, 2);
}

// ---------- 3D fabrication parts ----------

module front_panel_3d() {
    sheet_color()
        local_plate(wall_t)
            front_panel_2d();
}

module back_panel_3d() {
    sheet_color()
        local_plate(wall_t)
            back_panel_2d();
}

module side_panel_3d() {
    sheet_color()
        local_plate(wall_t)
            side_panel_2d();
}

module base_panel_3d() {
    sheet_color()
        linear_extrude(height = base_t)
            base_panel_2d();
}

module front_lip_3d() {
    glue_face_color()
        translate([0, front_lip_y, base_t])
            cube([dock_w, wall_t, front_lip_h], center = false);
}

module charger_spacer_ring_3d() {
    guide_color()
        local_plate(wall_t * 2)
            charger_spacer_ring_2d();
}

module watch_saddle_3d() {
    guide_color()
        local_plate(wall_t)
            watch_saddle_2d();
}

module rear_retainer_3d() {
    glue_face_color()
        local_plate(wall_t)
            rear_retainer_2d();
}

module on_front_plane() {
    translate([0, front_panel_y, base_t])
        rotate([panel_tilt, 0, 0])
            children();
}

module on_back_plane() {
    translate([0, back_panel_y, base_t])
        rotate([panel_tilt, 0, 0])
            children();
}

module charger_dummy() {
    color([0.08, 0.08, 0.08, 1.0])
        translate([dock_w / 2, -wall_t - charger_t / 2 + charger_face_offset, charger_center_z])
            cube([charger_w, charger_t, charger_h], center = true);
}

module watch_dummy() {
    color([0.02, 0.02, 0.02, 0.7])
        translate([dock_w / 2, -wall_t - charger_t - watch_body_t / 2, charger_center_z])
            rotate([90, 0, 0])
                cylinder(d = watch_d, h = watch_body_t, center = true);

    color([0.02, 0.02, 0.02, 0.35]) {
        translate([dock_w / 2, -wall_t - charger_t - 8, charger_center_z + watch_d / 2 + 28])
            cube([24, 3, 58], center = true);
        translate([dock_w / 2, -wall_t - charger_t - 8, charger_center_z - watch_d / 2 - 34])
            cube([24, 3, 70], center = true);
    }
}

module assembly() {
    base_panel_3d();
    front_lip_3d();

    on_front_plane() {
        front_panel_3d();
        translate([0, -wall_t - glue_gap, 0])
            charger_spacer_ring_3d();
        translate([0, -wall_t * 2 - glue_gap * 2, 0])
            watch_saddle_3d();
        charger_dummy();
        watch_dummy();
    }

    on_back_plane() {
        back_panel_3d();
        translate([dock_w / 2 - (charger_w + 16) / 2, -wall_t - glue_gap, charger_center_z - 8])
            rear_retainer_3d();
    }

    translate([0, 0, base_t])
        rotate([90, 0, 90])
            side_panel_3d();

    translate([dock_w, 0, base_t])
        rotate([90, 0, 90])
            side_panel_3d();
}

module fit_check() {
    on_front_plane() {
        front_panel_3d();
        translate([0, -wall_t - glue_gap, 0])
            charger_spacer_ring_3d();
        translate([0, -wall_t * 2 - glue_gap * 2, 0])
            watch_saddle_3d();
        charger_dummy();
        watch_dummy();
    }
}

// ---------- Cut layouts ----------

module cut_layout_2d() {
    // Wall parts are duplicated for stacked hardboard layers.
    for (i = [0 : wall_layers - 1]) {
        translate([i * (dock_w + layout_gap), 0])
            front_panel_2d();
        translate([i * (dock_w + layout_gap), dock_h + layout_gap])
            back_panel_2d();
    }

    for (i = [0 : wall_layers - 1]) {
        translate([wall_layers * (dock_w + layout_gap) + i * (dock_depth + layout_gap), 0])
            side_panel_2d();
        translate([wall_layers * (dock_w + layout_gap) + i * (dock_depth + layout_gap), dock_h + layout_gap])
            mirror([1, 0])
                side_panel_2d();
    }

    for (i = [0 : base_layers - 1]) {
        translate([0, (dock_h + layout_gap) * 2 + i * (dock_depth + layout_gap)])
            base_panel_2d();
    }

    translate([dock_w + layout_gap, (dock_h + layout_gap) * 2])
        front_lip_2d();
    translate([dock_w + layout_gap, (dock_h + layout_gap) * 2 + front_lip_h + layout_gap])
        charger_spacer_ring_2d();
    translate([dock_w + layout_gap, (dock_h + layout_gap) * 2 + front_lip_h + layout_gap + 58])
        watch_saddle_2d();
    translate([dock_w + layout_gap, (dock_h + layout_gap) * 2 + front_lip_h + layout_gap + 108])
        rear_retainer_2d();
}

module novice_cut_layout_2d() {
    // Beginner layout: removes side-panel lightening cutouts and adds
    // angle/glue helper pieces. Use with the assembly guide.
    for (i = [0 : wall_layers - 1]) {
        translate([i * (dock_w + layout_gap), 0])
            front_panel_2d();
        translate([i * (dock_w + layout_gap), dock_h + layout_gap])
            back_panel_2d();
    }

    for (i = [0 : wall_layers - 1]) {
        translate([wall_layers * (dock_w + layout_gap) + i * (dock_depth + layout_gap), 0])
            novice_side_panel_2d();
        translate([wall_layers * (dock_w + layout_gap) + i * (dock_depth + layout_gap), dock_h + layout_gap])
            mirror([1, 0])
                novice_side_panel_2d();
    }

    for (i = [0 : base_layers - 1]) {
        translate([0, (dock_h + layout_gap) * 2 + i * (dock_depth + layout_gap)])
            base_panel_2d();
    }

    translate([dock_w + layout_gap, (dock_h + layout_gap) * 2])
        front_lip_2d();
    translate([dock_w + layout_gap, (dock_h + layout_gap) * 2 + front_lip_h + layout_gap])
        charger_spacer_ring_2d();
    translate([dock_w + layout_gap, (dock_h + layout_gap) * 2 + front_lip_h + layout_gap + 58])
        watch_saddle_2d();
    translate([dock_w + layout_gap, (dock_h + layout_gap) * 2 + front_lip_h + layout_gap + 108])
        rear_retainer_2d();

    translate([dock_w * 2 + layout_gap * 2, (dock_h + layout_gap) * 2])
        angle_gauge_2d();
    translate([dock_w * 2 + layout_gap * 2, (dock_h + layout_gap) * 2 + 50])
        glue_spreader_2d();
}

module test_coupon_2d() {
    // Cut this before the full layout. Tune sheet_t, slot_fit,
    // charger_clearance, and strap slot dimensions from this test.
    translate([0, 0]) {
        difference() {
            rounded_rect_2d(42, 32, 3);
            translate([10, 7])
                rounded_rect_2d(tab_slot_h, tab_slot_w, 1.5);
            translate([25, 7])
                rounded_rect_2d(tab_slot_h + 0.4, tab_slot_w + 0.4, 1.5);
        }
    }

    translate([56, 0])
        rounded_rect_2d(tab_w, tab_h, 2);

    translate([92, 0]) {
        difference() {
            rounded_rect_2d(56, 56, 3);
            translate([28, 28])
                charger_opening_2d();
        }
    }

    translate([0, 48])
        rounded_rect_2d(strap_slot_w, strap_slot_h, 4);

    translate([56, 48])
        rounded_rect_2d(cable_channel_w, 42, 3);

    translate([92, 68])
        angle_gauge_2d();
}

module cut_layout_preview() {
    sheet_color()
        preview_plate(sheet_t)
            cut_layout_2d();
}

// ---------- View selection ----------

if (view_mode == 0) {
    assembly();
} else if (view_mode == 1) {
    cut_layout_2d();
} else if (view_mode == 2) {
    cut_layout_preview();
} else if (view_mode == 3) {
    front_panel_3d();
} else if (view_mode == 4) {
    back_panel_3d();
} else if (view_mode == 5) {
    side_panel_3d();
} else if (view_mode == 6) {
    base_panel_3d();
} else if (view_mode == 7) {
    fit_check();
} else if (view_mode == 8) {
    test_coupon_2d();
} else if (view_mode == 9) {
    novice_cut_layout_2d();
}
