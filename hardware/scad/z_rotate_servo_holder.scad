servo_y_dim = 20;
servo_x_dim = 55;
servo_z_dim = 40;

clearance = 1.5;

wall_thickness = 2;

servo_wire_y_dim = 8;
servo_wire_x_dim = 3;

difference(){
    translate([
        0,0,(servo_z_dim+wall_thickness)/2
    ])
    cube([
        servo_x_dim + wall_thickness + clearance,
        servo_y_dim + wall_thickness + clearance,
        servo_z_dim + wall_thickness
    ], center=true);

    translate([
        0,0,(servo_z_dim+wall_thickness)/2 + wall_thickness
    ])
    cube([
        servo_x_dim + clearance,
        servo_y_dim + clearance,
        servo_z_dim + wall_thickness
    ], center=true);
    
    // Servo wire hole
    translate([(servo_x_dim - 4)/2,0,0])
    cube([
        servo_wire_x_dim + clearance,
        servo_wire_y_dim + clearance,
        5
    ],center=true);
}

