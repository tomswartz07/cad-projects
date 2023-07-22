// Monoprice Workstream Monitor stand
// https://www.monoprice.com/product?p_id=43450
//
// Cap for the top of the pole, filling in the hole, where only one or two cables
// are used, as it is not necessary to have such a large gap.
// Units are in mm

/* [Dimensions] */
// Diameter of the hole
hole_diam = 21;
// Depth of the hole
hole_depth = 2.3;
// Diameter of the cable relief {larger for more cables}
cable_relief = 5;
// Thickness of the lid
thickness = 1.5;

/* [Hidden] */
eps = 0.01;

module body() {
        circle(r=hole_diam/2, $fn = 180);
}

module cap() {
	minkowski() {
		body();
		circle(r = thickness, $fn = 100);
	}
}

difference() {
        union() {
                // Put the body in the bracket hole
                linear_extrude(height=hole_depth) {
                        body();
                }
                // Put the cap on top of the body, plus a small eps amount
                translate([0,0,hole_depth+eps]) linear_extrude(height=thickness) {
                        cap();
                }
        }        
        translate([0,-hole_diam/2,0]) rotate(a=45, v=[1,0,0]) cylinder (h=20*thickness, r=cable_relief, center=true, $fn=180);
}
