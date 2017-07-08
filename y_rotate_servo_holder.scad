$fn = 30;

servo_x_dim = 19;
servo_y_dim = 42;
servo_z_dim_covered = 18;
servo_z_flange_dim = 7.5;


clearance = 1;

wall_thickness = 2;

//Main body

    union(){
        //Servo holder portion
        difference(){
            translate([0,0,servo_z_dim_covered/2])
            cube([
                servo_x_dim + clearance + wall_thickness,
                servo_y_dim + clearance + wall_thickness,
                servo_z_dim_covered + wall_thickness
            ], center = true);

            translate([0,0,servo_z_dim_covered/2 + wall_thickness])
            cube([
                servo_x_dim + clearance, 
                servo_y_dim + clearance,
                servo_z_dim_covered
            ], center = true);
        }
        // Large bottom z dim for interfacing
        difference(){
            translate([0,0,-3/2])
            cube([
                servo_x_dim + clearance + wall_thickness,
                servo_y_dim + clearance + wall_thickness,
                4
            ], center = true);
            translate([0,0,-4/2-.01])
            cube([
                5,
                7,
                4
            ], center = true);
            
        }
        
    }


//Center servo support block
translate([
    0,
    -(servo_y_dim + clearance - 10)/2,
    servo_z_flange_dim/2 + 2
])
cube([
    servo_x_dim+clearance, 
    10, 
    servo_z_flange_dim
], center=true);

