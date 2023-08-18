include <Nopscadlib/utils/core/core.scad>
use <Nopscadlib/utils/layout.scad>
include <Nopscadlib/vitamins/extrusions.scad>
include <NopSCADlib/lib.scad> 
//发布到github上

lizhu_height=1500;
zhijia_length_up=700;
zhijia_angle_up=30;
zhijia_length_down=1500;
zhijia_angle_down=30;


cube([40,10,lizhu_height]);
//上边
translate([0,0,800]){
translate([30,-10,10])
zhijia(zhijia_length_up,zhijia_angle_up);
translate([10,-10,10])
zhijia(zhijia_length_up,360-zhijia_angle_up);}
//下边
translate([0,0,50]){
translate([30,-10,10])
zhijia(zhijia_length_down,zhijia_angle_down);
translate([10,-10,10])
zhijia(zhijia_length_down,360-zhijia_angle_down);}


module zhijia(h,angle){
    rotate([0,angle,0])
    translate([-10,0,-10])
difference(){
union(){
translate([0,0,10])
    cube([20,10,h-10]);

translate([10,5,10])
    rotate([90,0,0]){
        cylinder(10,10,10,center=true);}
    }

translate([10,5,10])
    rotate([90,0,0]){
        cylinder(40,2,2,center=true);}

}
}

////滑轮
//translate([25,-6.5,10]){
//mini_v();
////三叉戟
//    translate([0,-10,-25])
//sanchaji();}


//地面轨道
//translate([0,10,10])
//rotate([0,90,0])
//extrusion(E2020,1000,center=false);



//滑轮
module mini_v() {
rotate([0,0,180])
translate([0,-6,0])
import("Mini_V_Gantry_Kit.stl");}