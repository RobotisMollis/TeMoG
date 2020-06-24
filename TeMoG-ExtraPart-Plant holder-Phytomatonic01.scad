//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Extra Part - Plant holder (used for "Phytomatonic 01" - described under case studies in the instruction manual)

$fn=30; //Set to 200 when generating the molds for 3D printing

//Main cone and mold
h = 180; //Cone height
maxDiam = 45; //Cone
minDiam = 35; //Cone
centerSolidDiam=15;
moldWallThickness = 3;
footDiam=100; //Foot for mold
siliconeThickness=3; //Outer
dividersThickness = 5;

//Bottom
straightHeightBottom = 20;
bottomThickness=4;
LDRHolderDiam= minDiam+3;
delta=0.4; //Inaccuracy of printer (layering and overextrusion)
LDRHoleDepth=8;
LDRHolderThickness = 8 +2.5;
LDRDiam=6;
LDRWireHolesDist=3;
LDRHoleDist=LDRHolderDiam/2-LDRDiam;
LDRNumber=3;

//Top part
straightHeight= 30; 
wiresDiameter=5; 

//Joints
jointThickness = 3;

//Finishing mold:
finMoldHeight=25;
finMoldWidth=30;
supportMoldLength=60;
supportMoldWidth=30;
FinalBottomThickness =8;

//Plant part
plantHoleDiam=16.25;
plantScrewsDiam=3.5;

translate ([0,0,-straightHeightBottom+(LDRHolderThickness-bottomThickness)])rotate(180, [1,0,0]) union() {

difference(){
//Main cylinder
translate([0,0,-bottomThickness]) cylinder(LDRHolderThickness,d2=plantHoleDiam-delta,d1=plantHoleDiam-delta);
translate([0,0,-bottomThickness+1]) cylinder(LDRHolderThickness+1,d2=plantHoleDiam-delta-2,d1=plantHoleDiam-delta-2);

//Hole for wires
cylinder(bottomThickness*2,d2=3,d1=2);

}

//Top cone-like part
difference() {
translate([0,0,(LDRHolderThickness-bottomThickness)]) cylinder(LDRHolderThickness/2,d1=plantHoleDiam-delta,d2=(2/3)*(plantHoleDiam-delta));
translate([0,0,(LDRHolderThickness-bottomThickness)]) cylinder(LDRHolderThickness/2,d1=plantHoleDiam-delta-2,d2=(2/3)*(plantHoleDiam-delta)-2);
}
}