//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Part 3c - Top Piece - LDR holder version (used for "Phytomatonic 01" - described under case studies in the instruction manual)

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

////Assembly on the sides of mold////
numberOfHoles = 4;
screwSize=5;
assemblyWidth= 22;

//Bottom
straightHeightBottom = 20;
bottomThickness=4;
LDRHolderThickness= 10-0.5;
LDRHolderDiam= minDiam+3-1;
delta=0.4; //Inaccuracy of printer (layering and overextrusion)
LDRHoleDepth=8;
LDRDiam=5; 
LDRWireHolesDist=2.5;//Distance between wires on LDR
LDRWireHolesSize=1; 
LDRHoleDist = LDRHolderDiam/2-LDRDiam/2-1;
LDRNumber=3;
centerHoleDiam=3; 

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
plantHoleDiam=17;
plantScrewsDiam=3.5;

rotate (60) translate ([0,0,-straightHeightBottom]) difference(){

cylinder(LDRHolderThickness-delta,d2=LDRHolderDiam-delta,d1=LDRHolderDiam-delta);
translate ([LDRHoleDist,0,0]) cylinder(LDRHoleDepth+delta,d2=LDRDiam+delta,d1=LDRDiam+delta);//LDR hole 1
translate ([LDRHoleDist,LDRWireHolesDist/2,0]) cylinder(LDRHolderThickness+delta,d2=LDRWireHolesSize+delta,d1=LDRWireHolesSize+delta); //Wire hole 1
translate ([LDRHoleDist,-LDRWireHolesDist/2,0]) cylinder(LDRHolderThickness+delta,d2=LDRWireHolesSize+delta,d1=LDRWireHolesSize+delta);//Wire hole 1
//Cut of for exposing LDRs to light in the right directions    
translate([LDRHoleDist-LDRDiam/2,-LDRHolderDiam/2,0]) cube([LDRHolderDiam/2, LDRHolderDiam,LDRHoleDepth], [0,0,0]);

rotate (360/LDRNumber, [0,0,1]) {
translate ([LDRHoleDist,0,0]) cylinder(LDRHoleDepth+delta,d2=LDRDiam+delta,d1=LDRDiam+delta);//LDR hole 2
translate ([LDRHoleDist,LDRWireHolesDist/2,0]) cylinder(LDRHolderThickness+delta,d2=LDRWireHolesSize+delta,d1=LDRWireHolesSize+delta); //Wire hole 2
translate ([LDRHoleDist,-LDRWireHolesDist/2,0]) cylinder(LDRHolderThickness+delta,d2=LDRWireHolesSize+delta,d1=LDRWireHolesSize+delta);//Wire hole 2
//Cut of for exposing LDRs to light in the right directions    
translate([LDRHoleDist-LDRDiam+1,-LDRHolderDiam/2,0]) cube([LDRHolderDiam/2, LDRHolderDiam,LDRHoleDepth], [0,0,0]);
    }

rotate (2*360/LDRNumber, [0,0,1]) {
translate ([LDRHoleDist,0,0]) cylinder(LDRHoleDepth+delta,d2=LDRDiam+delta,d1=LDRDiam+delta);//LDR hole 3
translate ([LDRHoleDist,LDRWireHolesDist/2,0]) cylinder(LDRHolderThickness+delta,d2=LDRWireHolesSize+delta,d1=LDRWireHolesSize+delta); //Wire hole 3
translate ([LDRHoleDist,-LDRWireHolesDist/2,0]) cylinder(LDRHolderThickness+delta,d2=LDRWireHolesSize+delta,d1=LDRWireHolesSize+delta);//Wire hole 3
//Cut of for exposing LDRs to light in the right directions    
translate([LDRHoleDist-LDRDiam+1,-LDRHolderDiam/2,0]) cube([LDRHolderDiam/2, LDRHolderDiam,LDRHoleDepth], [0,0,0]);
    }

//CENTER HOLE for thread
cylinder(LDRHolderThickness*2,d2=centerHoleDiam+delta,d1=centerHoleDiam+delta);
    
//CENTER HOLE for plant
translate([0,0,-bottomThickness]) cylinder(LDRHolderThickness,d2=plantHoleDiam,d1=plantHoleDiam);

//Cut of for exposing LDRs to light in the right directions    
translate([LDRHoleDist-LDRDiam+1,-LDRHolderDiam/2,0]) cube([LDRHolderDiam/2, LDRHolderDiam,LDRHoleDepth], [0,0,0]);
   
//Plug hooks to keep EcoFlex attached to PLA
rotate (60) translate ([(plantHoleDiam/2)+(LDRHolderDiam-plantHoleDiam)/4-1.5,0, LDRHolderThickness-(straightHeightBottom-LDRHolderThickness-siliconeThickness)]) cylinder(LDRHolderThickness-bottomThickness, d1=8, d2=2);
rotate (180) translate ([(plantHoleDiam/2)+(LDRHolderDiam-plantHoleDiam)/4-1.5,0, LDRHolderThickness-(straightHeightBottom-LDRHolderThickness-siliconeThickness)]) cylinder(LDRHolderThickness-bottomThickness, d1=8, d2=2);
rotate (300) translate ([(plantHoleDiam/2)+(LDRHolderDiam-plantHoleDiam)/4-1.5,0, LDRHolderThickness-(straightHeightBottom-LDRHolderThickness-siliconeThickness)]) cylinder(LDRHolderThickness-bottomThickness, d1=8, d2=2);
}


    