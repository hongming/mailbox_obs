include <Nopscadlib/utils/core/core.scad>
use <Nopscadlib/utils/layout.scad>
include <Nopscadlib/vitamins/extrusions.scad>
include <NopSCADlib/lib.scad> 
//发布到github上

base_height=800;
base_width=2000;
base_length=1800;
base_rail_length=3800;


cover_height=400;
cover_width=2000;
cover_length=1800;
cover_rail_length=1500;

//mount
translate([base_length/2,base_width/2+100,0]){
intersection()
{
    for(y=[-1:5])
for(x=[0:3])
{

mount(30*x,30*y);
}}

intersection(){
    for(y=[-5:1])
for(x=[-3:0])
{

mount(30*x,30*y);
}}

}




module mount(x,y){

cylinder(h=950,r=100,center=false);
translate([0,0,950])

rotate([30,0,0]){
rotate([0,x,0]){
    rotate([90,0,0])
color("red",0.1)
cylinder(h=300,r=230,center=true);
//SbS双镜
rotate([0,0,y]){
translate([-350,-500,230])
cube([600,1300,350]);}
//重锤    
translate([-100,150,-600])
cube([200,200,600]);
                }
               }
                }


//底座
    //四根竖立杆
    translate([10,10,0])
    extrusion(E2020,base_height,center=false);
    translate([10,base_width+10,0])
    extrusion(E2020,base_height,center=false);
    translate([base_length+10,10,0])
    extrusion(E2020,base_height-20,center=false);
    translate([base_length+10,base_width+10,0])
    color("red")
    extrusion(E2020,base_height-20,center=false);

    //上方轨道
    translate([20,10,base_height-10])
    rotate([0,90,0])
    extrusion(E2020,base_rail_length,center=false);

    translate([20,base_width+10,base_height-10])
    rotate([0,90,0])
    extrusion(E2020,base_rail_length,center=false);


    //底座和上方固定
    translate([20,10,10])
    rotate([0,90,0])
    extrusion(E2020,base_length-20,center=false);

    translate([20,base_width+10,10])
    rotate([0,90,0])
    extrusion(E2020,base_length-20,center=false);

    translate([10,base_width,10])
    rotate([90,0,0])
    extrusion(E2020,base_width-20,center=false);
    translate([base_length+10,base_width,10])
    rotate([90,0,0])
    extrusion(E2020,base_width-20,center=false);

    translate([0,0,base_height-40])
    {
        translate([10,base_width,10+20])
    rotate([90,0,0])
    extrusion(E2020,base_width-20,center=false);
    translate([base_length+10,base_width,10])
    rotate([90,0,0])
    extrusion(E2020,base_width-20,center=false);
        }

//外部泡沫-底部
    translate([0,-50,0])
        color("grey",0.2)
        cube([base_length+20,50,base_height-20]);
   
    translate([0,base_width+20,0])
        color("grey",0.2)
        cube([base_length+20,50,base_height-20]);
    
    
    translate([-50,-50-50,0])
        color("yellow",0.2)
        cube([50,base_width+20+100+50+50,base_height+cover_height+6.5]);
        
    translate([base_length+20,-50,0])
        color("grey",0.2)
        cube([50,base_width+20+100,base_height-20]);



//顶部盖子
translate([2000,0,base_height+6]){
//translate([0,0,0]){
    //四根竖立杆
    translate([10,10,0])
    extrusion(E2020,cover_height,center=false);
    translate([10,cover_width+10,0])
    extrusion(E2020,cover_height,center=false);
    translate([cover_length+10,10,0])
    extrusion(E2020,cover_height-20,center=false);
    translate([cover_length+10,cover_width+10,0])
    extrusion(E2020,cover_height-20,center=false);

    //上方轨道
    translate([20,10,cover_height-10])
    rotate([0,90,0])
    extrusion(E2020,cover_rail_length,center=false);

    translate([20,cover_width+10,cover_height-10])
    rotate([0,90,0])
    extrusion(E2020,cover_rail_length,center=false);


    //底座和上方固定
    translate([20,10,10]){
    rotate([0,90,0])
    color("red")
    extrusion(E2020,cover_length-20,center=false);
        //一侧滑轮
        translate([25,0,-10])
            mini_v();
        translate([base_rail_length-cover_length-100,0,-10])
            mini_v();
        translate([(base_rail_length-cover_length)/2,0,-10])
            mini_v();
        //另一侧滑轮
        translate([25,cover_width,-10])
            mini_v();
        translate([base_rail_length-cover_length-100,cover_width,-10])
            mini_v();
        translate([(base_rail_length-cover_length)/2,cover_width,-10])
            mini_v();
        }

    translate([20,cover_width+10,10])
    rotate([0,90,0])
    color("blue")
    extrusion(E2020,cover_length-20,center=false);


    translate([cover_length+10,cover_width,10])
    rotate([90,0,0])
    extrusion(E2020,cover_width-20,center=false);

    translate([0,0,cover_height-20])
    {
        translate([10,cover_width,10])
    rotate([90,0,0])
    extrusion(E2020,cover_width-20,center=false);
    translate([cover_length+10,cover_width,10])
    rotate([90,0,0])
    extrusion(E2020,cover_width-20,center=false);
        }


//顶部盖子-泡沫
    translate([0,-50,0])
        color("grey",0.2)
        cube([cover_length+20,50,cover_height]);
    translate([0,-100,-100])
        color("green",0.2)
        cube([cover_length+20,50,cover_height+100]);
        
    translate([0,cover_width+20,0])
        color("grey",0.2)
        cube([cover_length+20,50,cover_height]);
        
    translate([0,cover_width+20+50,-100])
        color("grey",0.2)
        cube([cover_length+20,50,cover_height+100]);      
        
    translate([cover_length+20,-50-50,-100])
        color("yellow",0.2)
        cube([50,cover_width+50+50+20+50+50,cover_height+100]);
        
    translate([-20-50-50,-100-20,cover_height])
        color("red",0.2)
        cube([cover_length+50+20+50+40+50,cover_width+50+50+20+100+40,100]);
    }


//滑轮
module mini_v() {
color("red")
rotate([90,0,0])
translate([0,-6,0])
import("Mini_V_Gantry_Kit.stl");}

