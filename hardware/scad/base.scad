servo_y_dim = 20;
servo_x_dim = 55;
servo_z_dim = 40;

clearance = 1.5;

wall_thickness = 2;

arduino_x_dim = 54;
arduino_y_dim = 69;
arduino_z_dim = 30;

arduino_tab_y_dim = 10;
arduino_tab_x_dim = 1;
arduino_tab_z_dim = 7;

//tab centered on arduino
arduino_tab_y_center = 30;

//Main base
difference(){
cube([
    arduino_x_dim + clearance + wall_thickness,
    arduino_y_dim + clearance + wall_thickness,
    2
],center=true);


translate([0,0,30])
difference(){
//Arduino Walls
translate([0,0,-arduino_z_dim/2])
    cube([
        arduino_x_dim + clearance + wall_thickness+1,
        arduino_y_dim + clearance + wall_thickness+1,
        arduino_z_dim

    ],center=true);
    
    translate([0,0,-(arduino_z_dim)/2-.03])
    cube([
        arduino_x_dim + clearance,
        arduino_y_dim + clearance,
        arduino_z_dim+.03
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

}
}
