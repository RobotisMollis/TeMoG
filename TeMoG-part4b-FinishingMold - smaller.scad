//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Part 4b - Finishing Mold - smaller version

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
bottomThickness=3.5;
LDRHolderThickness = 8 +2.5;
LDRHolderDiam= minDiam+3;
delta=0.4;
LDRHoleDepth=8;
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

//Main cone
difference(){

union() {
cylinder(40,d2=maxDiam+moldWallThickness*2-0.4,d1=maxDiam+moldWallThickness*2-0.4); //Solid cylinder
    }    

translate ([0,0,2]) cylinder(40,d2=maxDiam+moldWallThickness*2-4+0.4, d1=maxDiam+moldWallThickness*2-4+0.4); //Erase cylinder
}