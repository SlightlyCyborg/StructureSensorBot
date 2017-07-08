use<./servo_horn_interface.scad>

difference(){
translate([0,10,0])
import("./bracket.stl");

translate([-100,-0.3,-50])
cube([200,10,100]);
}

/*
translate([-2.5 - 25 - 2.5,-28,0])
rotate([0,90,0])
servo_horn_interface();
*/



difference(){
    translate([-27,-5.1,0])
    cube([14, 4, 28], center=true);
 
    translate([-27,-5.1,0])
    cube([5,5,7], center=true);
}