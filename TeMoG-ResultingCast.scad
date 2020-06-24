//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Rendering of the complete tentacle
//Note: Do not 3D print from this file, use it to visualize a design (see instruction manual). The inner parts of the tentacle can be made visible by uncommenting the lines of code at the bottom.

$fn=200; //Set to another value to obtain other resolution rendering

//Main cone and mold
h = 180; //Cone height
maxDiam = 45; //Cone
minDiam = 35; //Cone
centerSolidDiam=15;
moldWallThickness = 3;
footDiam=100; //Foot for mold
siliconeThickness=3; //Outer silicone walls
dividersThickness = 5; //Thickness of interior walls separating chambers

////Assembly on the sides of mold////
numberOfHoles = 4;
screwSize=5;
assemblyWidth= 22;

//Interior
numberOfChambers=3;

//Bottom
straightHeightBottom = 20;
bottomThickness=3.5;
LDRHolderThickness= 10;
LDRHolderDiam= minDiam+3;
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

difference(){

union() {

difference(){

//Top part
translate ([0,0,h]) cylinder(straightHeight,d2=maxDiam+6,d1=maxDiam+6);
cylinder(h,d2=maxDiam,d1=minDiam);

}

//Main cone
cylinder(h,d2=maxDiam,d1=minDiam);

//Straight bottom part
translate ([0,0,-straightHeightBottom]) difference(){
//cylinder(straightHeightBottom,d2=minDiam+moldWallThickness*2,d1=minDiam+moldWallThickness*2);
cylinder(straightHeightBottom,d2=minDiam,d1=minDiam);

}
}

//Three cone parts that make the inside chambers
difference(){
cylinder(h,d2=maxDiam-siliconeThickness*2,d1=minDiam-siliconeThickness*2);
cylinder(h,d2=centerSolidDiam,d1=centerSolidDiam);

for (i = [0:numberOfChambers]) { //Cut away parts to make separate chambers

rotate (i*360/numberOfChambers) translate ([0,-dividersThickness/2,0]) cube([maxDiam, dividersThickness,h], center=[0,0,0]);
}

}


//UNCOMMENT ONE OF THESE LINE TO SEE THE INNER OF THE TENTACLE BY SLICING A PART OFF IT:

//translate ([-footDiam/2,0,-straightHeightBottom-bottomThickness]) cube([footDiam,footDiam,h+straightHeight+straightHeightBottom+bottomThickness]); //Cut half off the mold

//translate([0,0,h-1])cylinder(h,d2=maxDiam+20,d1=maxDiam+20);

}
