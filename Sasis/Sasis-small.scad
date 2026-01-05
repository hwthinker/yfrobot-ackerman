$fn = 64;

// ==========================
// PARAMETER
// ==========================
sisi_belakang = 73.97;
sisi_depan    = 81.6;
panjang       = 40.69;

square_x = 60.25;
square_y = 81.6;

// Trapesium kedua
sisi_kiri_2  = 73.97;
sisi_kanan_2 = 59.65;
panjang_2    = 12.72;

// Square ke-3
square2_x = 25.04;
square2_y = 59.65;

// Square ke-4
square3_x = 17.45;
square3_y = 73;

// ==========================
// MODEL 2D (UNTUK PDF/DXF)
// ==========================
linear_extrude (height=3 , center=false) {
union() {

    square([square_x, square_y]);

    translate([square_x, square_y/2])
    polygon(points = [
        [0, -sisi_depan/2],
        [0,  sisi_depan/2],
        [panjang,  sisi_belakang/2],
        [panjang, -sisi_belakang/2]
    ]);

    translate([square_x + panjang, square_y/2])
    polygon(points = [
        [0, -sisi_kiri_2/2],
        [0,  sisi_kiri_2/2],
        [panjang_2,  sisi_kanan_2/2],
        [panjang_2, -sisi_kanan_2/2]
    ]);

    translate([
        square_x + panjang + panjang_2,
        square_y/2 - square2_y/2
    ])
    square([square2_x, square2_y]);

    translate([
        square_x + panjang + panjang_2 + square2_x,
        square_y/2 - square3_y/2
    ])
    square([square3_x, square3_y]);
}
}
