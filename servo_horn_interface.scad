$fn = 30;

rad=19;

module servo_horn_interface(){

difference(){
cylinder(r=rad, 7.5);

translate([0,0,-0.5])
linear_extrude(80){
for(i=[0:5])
rotate([0,0,360/6*i])
polygon([[7,0],[2.05,15],[1,15.75],[0,16.05],[-1, 15.75],[-2.05,15],[-7,0]]);
}

}

translate([0,0,-2])
cylinder(r=rad, 2);

translate([21,0,2.7])
cube([4.7,6.7,4.7],center=true);
}

servo_horn_interface();

