const fs = require("fs");
const path = require("path");

const outDir = path.join(__dirname, "..", "making-docs", "exports", "a4-templates");
fs.mkdirSync(outDir, { recursive: true });

const W = 210;
const H = 297;
const LW = 0.35;

const p = {
  sheet_t: 1.5,
  dock_w: 78,
  dock_depth: 102,
  dock_h: 116,
  face_t: 3,
  charger_w: 39.5,
  charger_h: 39.5,
  charger_fit: 0.7,
  charger_corner_r: 4,
  charger_center_z: 74,
  strap_slot_w: 34,
  strap_slot_h: 13,
  strap_slot_center_z: 42,
  cable_hole_d: 14,
  cable_channel_w: 10,
  cable_bend_w: 26,
  cable_bend_h: 16,
  tab_w: 18,
  tab_h: 10,
  slot_fit: 0.45,
  brace_w: 62,
  brace_h: 16,
  front_lip_h: 16,
  watch_d: 47.3,
  panel_angle: 64,
};
p.tab_slot_w = p.tab_w + p.slot_fit;
p.tab_slot_h = p.face_t + p.slot_fit;

function esc(s) {
  return String(s).replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
}

function rrPath(x, y, w, h, r) {
  r = Math.min(r, w / 2, h / 2);
  return `M ${x + r} ${y} H ${x + w - r} Q ${x + w} ${y} ${x + w} ${y + r} V ${y + h - r} Q ${x + w} ${y + h} ${x + w - r} ${y + h} H ${x + r} Q ${x} ${y + h} ${x} ${y + h - r} V ${y + r} Q ${x} ${y} ${x + r} ${y} Z`;
}

function polyPath(points) {
  return `M ${points.map((pt) => pt.join(" ")).join(" L ")} Z`;
}

function shape(pathData, cls = "cut") {
  return `<path class="${cls}" d="${pathData}"/>`;
}

function label(x, y, text, size = 4, cls = "label") {
  return `<text class="${cls}" x="${x}" y="${y}" font-size="${size}">${esc(text)}</text>`;
}

function note(x, y, text, size = 3.2) {
  return `<text class="note" x="${x}" y="${y}" font-size="${size}">${esc(text)}</text>`;
}

function page(name, title, body, landscape = false) {
  const w = landscape ? H : W;
  const h = landscape ? W : H;
  const svg = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="${w}mm" height="${h}mm" viewBox="0 0 ${w} ${h}">
  <style>
    .cut { fill: none; stroke: #000; stroke-width: ${LW}; }
    .hole { fill: none; stroke: #000; stroke-width: ${LW}; }
    .guide { fill: none; stroke: #000; stroke-width: 0.25; stroke-dasharray: 2 1.5; }
    .label { font-family: Arial, sans-serif; fill: #000; font-weight: 700; }
    .note { font-family: Arial, sans-serif; fill: #000; }
    .tiny { font-family: Arial, sans-serif; fill: #000; }
  </style>
  <rect x="0" y="0" width="${w}" height="${h}" fill="white"/>
  <rect class="guide" x="5" y="5" width="${w - 10}" height="${h - 10}"/>
  ${label(8, 12, title, 4.5)}
  ${note(8, 18, "인쇄 설정: A4, 실제 크기 100%, 페이지 맞춤/축소 금지. 아래 50mm 선을 자로 확인.", 3.1)}
  <line class="cut" x1="8" y1="24" x2="58" y2="24"/>
  ${note(8, 28, "50mm scale check", 3)}
  ${body}
</svg>`;
  fs.writeFileSync(path.join(outDir, name), svg, "utf8");
}

function frontPanel(x, y) {
  const cw = p.charger_w + p.charger_fit * 2;
  const ch = p.charger_h + p.charger_fit * 2;
  return [
    shape(rrPath(x, y, p.dock_w, p.dock_h, 2)),
    shape(rrPath(x + p.dock_w / 2 - 15, y + p.charger_center_z + 30, 30, 9, 4), "hole"),
    shape(rrPath(x + p.dock_w / 2 - cw / 2, y + p.charger_center_z - ch / 2, cw, ch, p.charger_corner_r), "hole"),
    shape(rrPath(x + p.dock_w / 2 - 13, y + p.charger_center_z - 35, 26, 11, 4), "hole"),
    shape(rrPath(x + p.dock_w / 2 - p.strap_slot_w / 2, y + p.strap_slot_center_z - p.strap_slot_h / 2, p.strap_slot_w, p.strap_slot_h, 4), "hole"),
    label(x, y - 3, "전면판 FRONT x2"),
  ].join("\n");
}

function rearPanel(x, y) {
  return [
    shape(rrPath(x, y, p.dock_w, p.dock_h, 2)),
    `<circle class="hole" cx="${x + p.dock_w / 2}" cy="${y + p.charger_center_z}" r="${p.cable_hole_d / 2}"/>`,
    shape(rrPath(x + p.dock_w / 2 - p.cable_channel_w / 2, y + 7, p.cable_channel_w, p.charger_center_z - p.cable_hole_d / 2 - 7, 3), "hole"),
    shape(rrPath(x + p.dock_w / 2 - p.cable_bend_w / 2, y + p.charger_center_z - p.cable_bend_h / 2, p.cable_bend_w, p.cable_bend_h, 5), "hole"),
    label(x, y - 3, "후면판 REAR x2"),
  ].join("\n");
}

function basePanel(x, y, n) {
  const xs = [p.face_t + 5, p.dock_w - p.face_t - 5 - p.tab_slot_h];
  const ys = [24, 70];
  const parts = [shape(rrPath(x, y, p.dock_w, p.dock_depth, 3))];
  for (const sx of xs) for (const sy of ys) parts.push(shape(rrPath(x + sx, y + sy, p.tab_slot_h, p.tab_slot_w, 1.5), "hole"));
  parts.push(shape(rrPath(x + p.dock_w / 2 - p.cable_channel_w / 2, y + p.dock_depth - 18, p.cable_channel_w, 16, 3), "hole"));
  parts.push(label(x, y - 3, `바닥판 BASE ${n}/3`));
  return parts.join("\n");
}

function sidePanel(x, y, mirrored, n) {
  const pts = [
    [0, 0],
    [p.dock_depth, 0],
    [p.dock_depth, p.dock_h],
    [p.dock_depth - 19, p.dock_h],
    [19, 19],
    [0, 19],
  ];
  const transformPoint = ([px, py]) => mirrored ? [x + p.dock_depth - px, y + p.tab_h + py] : [x + px, y + p.tab_h + py];
  const parts = [shape(polyPath(pts.map(transformPoint)))];
  const tabXs = [24, 70];
  for (const tx of tabXs) {
    const rx = mirrored ? x + p.dock_depth - tx - p.tab_w : x + tx;
    parts.push(shape(rrPath(rx, y, p.tab_w, p.tab_h + 0.1, 1.5)));
  }
  const notchX = mirrored ? x + p.dock_depth - (p.dock_depth - 16) - 10 : x + p.dock_depth - 16;
  parts.push(shape(rrPath(notchX, y + p.tab_h + 18, 10, 30, 3), "hole"));
  parts.push(label(x, y - 3, `${mirrored ? "오른쪽" : "왼쪽"} 측판 SIDE ${n}/2`));
  return parts.join("\n");
}

function chargerRing(x, y, n) {
  const innerW = p.charger_w + p.charger_fit * 2;
  const innerH = p.charger_h + p.charger_fit * 2;
  const outerW = innerW + p.face_t * 2 + 3;
  const outerH = innerH + p.face_t * 2 + 3;
  return [
    shape(rrPath(x, y, outerW, outerH, p.charger_corner_r + 4.5)),
    shape(rrPath(x + (outerW - innerW) / 2, y + (outerH - innerH) / 2, innerW, innerH, p.charger_corner_r), "hole"),
    label(x, y - 2, `충전기 링 ${n}/4`, 3.2),
  ].join("\n");
}

function watchSaddle(x, y, n) {
  const outerD = p.watch_d + 10;
  const innerD = p.watch_d + 2.5;
  const cx = x + outerD / 2;
  const cy = y + outerD / 2;
  return [
    `<path class="cut" d="M ${cx - outerD / 2} ${cy + 6} A ${outerD / 2} ${outerD / 2} 0 0 0 ${cx + outerD / 2} ${cy + 6}"/>`,
    `<path class="hole" d="M ${cx - innerD / 2} ${cy + 6} A ${innerD / 2} ${innerD / 2} 0 0 0 ${cx + innerD / 2} ${cy + 6}"/>`,
    `<line class="cut" x1="${cx - outerD / 2}" y1="${cy + 6}" x2="${cx - innerD / 2}" y2="${cy + 6}"/>`,
    `<line class="cut" x1="${cx + innerD / 2}" y1="${cy + 6}" x2="${cx + outerD / 2}" y2="${cy + 6}"/>`,
    label(x, y - 2, `시계 받침 ${n}/2`, 3.2),
  ].join("\n");
}

function rearRetainer(x, y, n) {
  const w = p.charger_w + 18;
  return [
    shape(rrPath(x, y, w, 18, 3)),
    `<circle class="hole" cx="${x + w / 2}" cy="${y + 9}" r="${p.cable_hole_d / 2}"/>`,
    label(x, y - 2, `후면 고정판 ${n}/2`, 3.2),
  ].join("\n");
}

function lowerBrace(x, y, n) {
  return [
    shape(rrPath(x, y, p.brace_w, p.brace_h, 2)),
    shape(rrPath(x + p.brace_w / 2 - p.cable_channel_w / 2, y + 2, p.cable_channel_w, p.brace_h - 4, 3), "hole"),
    label(x, y - 2, `하부 보강대 ${n}/2`, 3.2),
  ].join("\n");
}

function frontLip(x, y, n) {
  return [
    shape(rrPath(x, y, p.dock_w, p.front_lip_h, 2)),
    label(x, y - 2, `앞 턱 ${n}/2`, 3.2),
  ].join("\n");
}

function angleGauge(x, y) {
  const gw = 62;
  const gh = gw * Math.tan((90 - p.panel_angle) * Math.PI / 180);
  return [
    shape(polyPath([[x, y], [x + gw, y], [x + gw, y + gh]])),
    shape(rrPath(x + 8, y + 6, 20, 8, 2), "hole"),
    label(x, y - 2, "각도 게이지 선택 x1", 3.2),
  ].join("\n");
}

function glueSpreader(x, y) {
  return [
    shape(rrPath(x, y, 58, 11, 2)),
    label(x, y - 2, "풀 펴개 선택 x1", 3.2),
  ].join("\n");
}

page("a4_00_cut_list.svg", "A4 손재단 수량표", [
  note(12, 42, "1. 먼저 테스트 쿠폰 1장을 잘라 실제 충전기/케이블/하드보드 두께를 확인합니다.", 4),
  note(12, 52, "2. 본 제작은 1.5mm 하드보드 기준입니다. 같은 모양을 여러 장 잘라 붙여 두께를 만듭니다.", 4),
  note(12, 62, "3. 필요한 실제 부품 수량:", 4),
  note(18, 76, "- 전면판 2장, 후면판 2장", 4),
  note(18, 88, "- 왼쪽 측판 2장, 오른쪽 측판 2장", 4),
  note(18, 100, "- 바닥판 3장", 4),
  note(18, 112, "- 앞 턱 2장", 4),
  note(18, 124, "- 충전기 링 4장", 4),
  note(18, 136, "- 시계 받침 2장", 4),
  note(18, 148, "- 후면 고정판 2장", 4),
  note(18, 160, "- 하부 보강대 2장", 4),
  note(18, 172, "- 각도 게이지/풀 펴개는 조립 보조용이라 1장씩 선택", 4),
  note(12, 194, "A4 출력 팁: 프린터 대화상자에서 '실제 크기', '100%', '배율 없음'을 고르세요.", 4),
  note(12, 206, "출력 후 이 페이지의 50mm 선이 진짜 50mm인지 재고, 다르면 프린터 배율을 고치세요.", 4),
].join("\n"));

page("a4_01_test_coupon.svg", "A4 01 - 테스트 쿠폰 먼저 자르기", [
  label(15, 38, "이 페이지는 풀 제작 전에 1번만 자릅니다.", 4),
  shape(rrPath(18, 55, 46, 34, 3)),
  shape(rrPath(28, 63, p.tab_slot_h, p.tab_slot_w, 1.5), "hole"),
  shape(rrPath(45, 63, p.tab_slot_h + 0.4, p.tab_slot_w + 0.4, 1.5), "hole"),
  label(18, 52, "탭 구멍 테스트", 3.2),
  shape(rrPath(78, 55, p.tab_w, p.tab_h, 2)),
  label(78, 52, "탭", 3.2),
  chargerRing(116, 55, 1),
  shape(rrPath(18, 112, p.strap_slot_w, p.strap_slot_h, 4)),
  label(18, 109, "스트랩 구멍", 3.2),
  shape(rrPath(78, 112, p.cable_channel_w, 44, 3)),
  label(78, 109, "케이블 홈", 3.2),
  angleGauge(116, 123),
  lowerBrace(18, 174, 1),
].join("\n"));

page("a4_02_front_rear.svg", "A4 02 - 전면판/후면판", [
  frontPanel(18, 42),
  rearPanel(114, 42),
  note(18, 174, "전면판 2장, 후면판 2장을 잘라서 같은 것끼리 겹쳐 붙입니다.", 4),
  note(18, 186, "전면 큰 사각 구멍은 충전기가 들어가는 자리입니다.", 4),
  note(18, 198, "후면 긴 홈은 케이블이 내려오는 길입니다.", 4),
].join("\n"));

page("a4_03_base.svg", "A4 03 - 바닥판 3장", [
  basePanel(18, 42, 1),
  basePanel(114, 42, 2),
  basePanel(18, 164, 3),
  note(114, 180, "바닥판은 총 3장입니다.", 4),
  note(114, 192, "세 장을 정확히 맞춰 붙여야 도크가 흔들리지 않습니다.", 4),
].join("\n"));

page("a4_04_side_panels.svg", "A4 04 - 측판 왼쪽/오른쪽", [
  sidePanel(18, 46, false, 1),
  sidePanel(158, 46, true, 1),
  note(18, 178, "이 페이지의 왼쪽/오른쪽 측판 세트를 2번 따라 그립니다.", 4),
  note(18, 190, "결과: 왼쪽 측판 2장 + 오른쪽 측판 2장.", 4),
  note(18, 202, "초보자는 가운데 큰 삼각 구멍 없는 이 템플릿을 쓰는 것이 더 튼튼합니다.", 4),
].join("\n"), true);

page("a4_05_small_parts.svg", "A4 05 - 작은 부품 전부", [
  frontLip(12, 42, 1),
  frontLip(112, 42, 2),
  chargerRing(12, 82, 1),
  chargerRing(82, 82, 2),
  chargerRing(12, 150, 3),
  chargerRing(82, 150, 4),
  watchSaddle(145, 76, 1),
  watchSaddle(145, 142, 2),
  rearRetainer(12, 218, 1),
  rearRetainer(82, 218, 2),
  lowerBrace(12, 258, 1),
  lowerBrace(82, 258, 2),
  angleGauge(145, 210),
  glueSpreader(145, 258),
].join("\n"));

console.log(`Wrote A4 templates to ${outDir}`);
