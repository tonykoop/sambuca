// Sambuca parametric envelope master — boat-shaped arched harp (SAM family).
//
// Authority: pending_measurement. NOT fabrication authority. This is an
// independent OpenSCAD envelope generated from the authoritative global
// equations; it does NOT supersede the SolidWorks MasterLayout rebuild
// (cad/SW-MIGRATION-CHECKLIST.md) and carries no measured-template gates.
// See visual-output-register.csv and cad/mcp-session-log.md.
//
// Dimension sources (do NOT edit values without updating the source record):
//   - all nominal dimensions: cad/SAM-000_master-equations.txt (single
//     source of truth; variable names mirrored below in inches)
//   - family scale + string counts: family-spec.csv (5 variants)
//   - string-length model + tuning: master-equations.txt f*_hz / L*_in block
//     (length-frequency exponent 0.85; NOT modeled as geometry here, cited)
//   - hull depth ratio (D/L) commentary: design.md / family-spec release notes
//
// Units: inches (matches master-equations.txt). family-spec.csv is in mm.

/* [Family variant] */
// 0=SAM-13-ROOT, 1=SAM-19-MID, 2=SAM-25-CONCERT, 3=SAM-13-AE, 4=SAM-13-MULE
variant = 0;

// body_length per family-spec.csv (mm) → inches. SAM-13=650, SAM-19=850,
// SAM-25=1050 mm. AE/MULE share the SAM-13 envelope.
body_length_in_by_variant = [25.591, 33.465, 41.339, 25.591, 25.591];
string_count_by_variant    = [13, 19, 25, 13, 13];

body_length_in = body_length_in_by_variant[variant];
string_count   = string_count_by_variant[variant];

// scale_factor per master-equations.txt: body_length / 25.591 (SAM-13 root).
scale_factor = body_length_in / 25.591;

/* [Boat hull — master-equations.txt] */
body_width_in         = 5.906 * scale_factor;  // 150 mm at root
body_depth_in         = 7.874 * scale_factor;  // 200 mm at root (D/L ~0.31)
hull_wall_in          = 0.236;                 // hull wall thickness
soundboard_thick_in   = 0.118;                 // ~3 mm western red cedar

/* [Neck — curved cantilever, master-equations.txt] */
instrument_height_in  = 31.890 * scale_factor;
// neck_arc_length = instrument_height - body_depth + 1.969 (equations)
neck_arc_length_in    = instrument_height_in - body_depth_in + 1.969;
neck_curve_radius_in  = 0.5 * neck_arc_length_in;
neck_width_in         = 1.496;
neck_depth_in         = 1.969;
joint_collar_height_in = 2.362;

/* [String-holder strip — master-equations.txt] */
strip_x_from_stern_in = body_length_in * 0.80;
strip_length_in       = 4.724 * scale_factor;
strip_width_in        = 0.394;
strip_thick_in        = 0.157;
// string_spacing = strip_length / (string_count + 1)
string_spacing_in     = strip_length_in / (string_count + 1);
tie_hole_dia_in       = 0.059;

/* [Keel-port soundhole — master-equations.txt] */
keel_port_long_in     = 3.150 * scale_factor;
keel_port_short_in    = 1.969 * scale_factor;
keel_port_x_from_bow_in = body_length_in * 0.55;

$fn = 64;

// ---------------------------------------------------------------------------
// Modules (formulas, not baked values)
// ---------------------------------------------------------------------------

module boat_hull() {
  // Half-ellipsoid hull, open top, hollowed to hull_wall_in.
  difference() {
    // outer hull: half-ellipsoid (lower half)
    scale([body_length_in / 2, body_width_in / 2, body_depth_in])
      difference() {
        sphere(r = 1);
        translate([0, 0, 1]) cube(2, center = true); // keep lower half
      }
    // inner cavity
    scale([(body_length_in / 2 - hull_wall_in),
           (body_width_in / 2 - hull_wall_in),
           (body_depth_in - hull_wall_in)])
      difference() {
        sphere(r = 1);
        translate([0, 0, 1]) cube(2, center = true);
      }
  }
}

module soundboard() {
  // Elliptical top plate closing the hull, with the keel-port cut.
  difference() {
    scale([body_length_in / 2, body_width_in / 2, 1])
      cylinder(h = soundboard_thick_in, r = 1, center = false);
    // keel port: elliptical, forward of center toward the bow (+x)
    translate([keel_port_x_from_bow_in - body_length_in / 2, 0, -0.05])
      scale([keel_port_long_in / 2, keel_port_short_in / 2, 1])
        cylinder(h = soundboard_thick_in + 0.2, r = 1);
  }
}

module string_holder_strip() {
  // Near the bow (+x), string tie strip; tie holes at string_spacing.
  translate([strip_x_from_stern_in - body_length_in / 2,
             -strip_length_in / 2, soundboard_thick_in]) {
    difference() {
      cube([strip_width_in, strip_length_in, strip_thick_in]);
      for (i = [1 : string_count])
        translate([strip_width_in / 2, i * string_spacing_in, -0.05])
          cylinder(h = strip_thick_in + 0.1, d = tie_hole_dia_in);
    }
  }
}

module neck_arc() {
  // Curved cantilever neck approximated as a torus quarter-segment rising
  // from the stern (-x) end. Radius from master-equations neck_curve_radius.
  R = neck_curve_radius_in;
  translate([-body_length_in / 2, 0, body_depth_in * 0.1])
    rotate([90, 0, 0])
      rotate_extrude(angle = 110, $fn = 96)
        translate([R, 0, 0])
          square([neck_depth_in, neck_width_in], center = true);
}

module string_lines() {
  // Visual string paths from strip tie holes toward the neck head.
  head = [-body_length_in / 2 - neck_curve_radius_in * 0.2,
          0, body_depth_in + neck_arc_length_in * 0.5];
  for (i = [1 : string_count]) {
    p0 = [strip_x_from_stern_in - body_length_in / 2 + strip_width_in / 2,
          -strip_length_in / 2 + i * string_spacing_in,
          soundboard_thick_in];
    hull() {
      translate(p0) sphere(r = 0.02);
      translate(head + [0, p0[1] * 0.1, 0]) sphere(r = 0.02);
    }
  }
}

module sambuca_assembly() {
  boat_hull();
  translate([0, 0, 0]) soundboard();
  string_holder_strip();
  neck_arc();
  string_lines();
}

sambuca_assembly();

// Echo the string tuning + length table so `openscad` doubles as a check
// (frequencies + modeled string lengths per master-equations.txt).
f_min_hz = (variant == 2) ? 110.0 : (variant == 1) ? 146.8 : 196.0;
semitone_steps = [0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21];
for (n = [0 : min(string_count, len(semitone_steps)) - 1])
  echo(str("string_", n + 1, "_hz=", f_min_hz * pow(2, semitone_steps[n] / 12)));
echo(str("string_spacing_in=", string_spacing_in,
         " scale_factor=", scale_factor));
