$fn = 30;

rad=19;

module servo_horn_interface(){

difference(){
cylinder(r=rad, 7.5);

translate([0,0,-0.5])
linear_extrude(80){
for(i=[0:5])
rotate([0,0,360/6*i])
polygon([[10,0],[2.05,15],[1.3,16.1],[0,16.75],[-1.3, 16.1],[-2.05,15],[-10,0]]);
}

}

difference(){
translate([0,0,-5])
cylinder(r=rad, 5);

translate([0,0,-(3/2 + 2 + .01)])
rotate([0,0,0])
cube([5,7,3],center=true);
}
}

servo_horn_interface();

