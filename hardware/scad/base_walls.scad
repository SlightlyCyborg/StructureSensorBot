$fn = 30;

servo_y_dim = 20;
servo_x_dim = 55;
servo_z_dim = 40;

servo_wire_y_dim = 8;
servo_wire_x_dim = 3;

clearance = 1.5;

wall_thickness = 2;

arduino_x_dim = 54;
arduino_y_dim = 69;
arduino_z_dim = 30;


arduino_tab_z_dim = 20;

//tab centered on arduino
arduino_tab_y_center = 30;

//Top
difference(){
translate([0,0,1])
cube([
    arduino_x_dim + clearance + wall_thickness,
    arduino_y_dim + clearance + wall_thickness,
    2
],center=true);
    
    //Servo holder_impression
    translate([0,0,22])
    rotate([0,0,90])
    cube([
        servo_x_dim + wall_thickness + clearance,
        servo_y_dim + wall_thickness + clearance,
        servo_z_dim + wall_thickness
    ], center=true);

    // Servo wire hole
    translate([0,(servo_x_dim - 4)/2,0])
    rotate([0,0,90])
    cube([
        servo_wire_x_dim + clearance,
        servo_wire_y_dim + clearance,
        5
    ],center=true);
    
        translate([0,-(servo_x_dim)/2-5,0])
    rotate([0,0,90])
    cube([
        servo_wire_x_dim + clearance,
        servo_wire_y_dim + clearance,
        5
    ],center=true);
    
}

difference(){
//Arduino Walls
translate([0,0,-arduino_z_dim/2])
    cube([
        arduino_x_dim + clearance + wall_thickness,
        arduino_y_dim + clearance + wall_thickness,
        arduino_z_dim

    ],center=true);
    
    translate([0,0,-(arduino_z_dim)/2-.03])
    cube([
        arduino_x_dim + clearance,
        arduino_y_dim + clearance,
        arduino_z_dim+.03
    ],center=true);
    
    // Servo wire holes
    translate([0,(servo_x_dim - 4)/2,0])
    rotate([0,0,90])
    cube([
        servo_wire_x_dim + clearance,
        servo_wire_y_dim + clearance,
        5
    ],center=true);
    

    translate([0,-(servo_x_dim)/2-5,0])
    rotate([0,0,90])
    cube([
        servo_wire_x_dim + clearance,
        servo_wire_y_dim + clearance,
        5
    ],center=true);
    
    //Slots for arduino USB and Power
     translate([
        -(arduino_x_dim/2 - 23/2),
        -arduino_y_dim/2,
        -arduino_z_dim - .01 + arduino_tab_z_dim/2])
    cube([
        23,
        10,
        arduino_tab_z_dim
    ],center=true);

    translate([
        (arduino_x_dim/2 - 18/2),
        -arduino_y_dim/2,
        -arduino_z_dim - .01 + arduino_tab_z_dim/2])
    cube([
        18,
        10,
        arduino_tab_z_dim
    ],center=true);
    
    //Power Supply __ NOT NEEDED FOR FU SERVOS __
    translate([2,-30,-10])
    rotate([90,0,0])
    cylinder(d=7.5, 20);::hSejjjjjj


}




