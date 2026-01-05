$fn = 64;

// ==========================
// PARAMETER UTAMA
// ==========================
sisi_belakang = 73.97;
sisi_depan    = 81.6;
panjang       = 40.69;

// Square ke-1
square_x = 61.25;
square_y = 81.6;

// Trapesium ke-1
sisi_kiri_1  = 73.97;
sisi_kanan_1 = 59.65;
panjang_2    = 12.72;

// Square ke-2
square2_x = 27.58;
square2_y = 59.65;

// Square ke-3
square3_x = 29.91;
square3_y = 59.65;

// Square ke-4
square4_x = 24.44;
square4_y = 58;

// Square ke-5
square5_x = 37.62;
square5_y = 126.89;

// ==========================
// PARAMETER KUPING LINGKARAN (Square-3)
// ==========================
diameter_kuping = 29.91;
r_kuping = diameter_kuping / 2;

// ==========================
// PARAMETER KUPING TRAPESIUM (Square-5)
// ==========================
kuping_outer  = 21.02;   // lebar luar kuping
kuping_height = 12.42;    // tinggi kuping (Y)

// ==========================
// MODEL 2D (UNTUK PDF / DXF)
// ==========================
union() {

    // ======================
    // SQUARE 1
    // ======================
    square([square_x, square_y]);

    // ======================
    // TRAPESIUM 1
    // ======================
    translate([square_x, square_y/2])
    polygon(points=[
        [0, -sisi_depan/2],
        [0,  sisi_depan/2],
        [panjang,  sisi_belakang/2],
        [panjang, -sisi_belakang/2]
    ]);

    // ======================
    // TRAPESIUM 2
    // ======================
    translate([square_x + panjang, square_y/2])
    polygon(points=[
        [0, -sisi_kiri_1/2],
        [0,  sisi_kiri_1/2],
        [panjang_2,  sisi_kanan_1/2],
        [panjang_2, -sisi_kanan_1/2]
    ]);

    // ======================
    // SQUARE 2
    // ======================
    translate([
        square_x + panjang + panjang_2,
        square_y/2 - square2_y/2
    ])
    square([square2_x, square2_y]);

    // ======================
    // SQUARE 3
    // ======================
    tx3 = square_x + panjang + panjang_2 + square2_x;
    ty3 = square_y/2 - square3_y/2;

    translate([tx3, ty3])
    square([square3_x, square3_y]);

    // Kuping setengah lingkaran (Square-3)
    mid_x3 = tx3 + square3_x/2;
    top_y3 = ty3 + square3_y;
    bottom_y3 = ty3;

    // Kuping atas
    translate([mid_x3, top_y3])
    intersection() {
        circle(r=r_kuping);
        translate([-r_kuping, 0])
        square([2*r_kuping, r_kuping]);
    }

    // Kuping bawah
    translate([mid_x3, bottom_y3])
    intersection() {
        circle(r=r_kuping);
        translate([-r_kuping, -r_kuping])
        square([2*r_kuping, r_kuping]);
    }

    // ======================
    // SQUARE 4
    // ======================
    translate([
        square_x + panjang + panjang_2 + square2_x + square3_x,
        square_y/2 - square4_y/2
    ])
    square([square4_x, square4_y]);

    // ======================
    // SQUARE 5
    // ======================
    tx5 = square_x + panjang + panjang_2 + square2_x + square3_x + square4_x;
    ty5 = square_y/2 - square5_y/2;

    translate([tx5, ty5])
    square([square5_x, square5_y]);

    // ======================
    // KUPING TRAPESIUM SQUARE-5
    // ======================
    mid_x5 = tx5 + square5_x/2;
    top_y5 = ty5 + square5_y;
    bottom_y5 = ty5;

    // Kuping atas
    translate([mid_x5, top_y5])
    polygon(points=[
        [-square5_x/2, 0],
        [ square5_x/2, 0],
        [ kuping_outer/2, kuping_height],
        [-kuping_outer/2, kuping_height]
    ]);

    // Kuping bawah
    translate([mid_x5, bottom_y5])
    polygon(points=[
        [-square5_x/2, 0],
        [ square5_x/2, 0],
        [ kuping_outer/2, -kuping_height],
        [-kuping_outer/2, -kuping_height]
    ]);
}
