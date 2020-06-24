//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Part 1 - Outer Mold
//Note: 3D print two copies of this mold part

$fn=30; //Set to 200 when generating the molds for 3D printing

//Global variables
moldWallThickness = 3;
siliconeThickness=3; //Wall thickness of the silicone tentacle 

//Main cone part
h = 200; //Cone height
maxDiam = 40; 
minDiam = 35; 

////Assembly on the sides of mold
numberOfHoles = 4;
screwSize=5;
assemblyWidth= 22;

//Bottom
straightHeightBottom = 20;
bottomThickness=3.5;
footDiam=100; //Foot for the mold

//LDR holder
LDRHolderThickness=0;
LDRHolderDiam=minDiam+3;
LDRHoleDepth=8;
LDRDiam=6; 
LDRWireHolesDist=3;
LDRHoleDist=LDRHolderDiam/2-LDRDiam;
LDRNumber=3;

//Top part
straightHeight= 20; 
wiresDiameter=5; 

//Finishing mold:
finMoldHeight=25;
finMoldWidth=30;
supportMoldLength=60;
supportMoldWidth=30;
FinalBottomThickness =8;


difference(){

union() {

difference(){

//Top part of mold
translate ([0,0,h-3]) cylinder(straightHeight+3,d2=maxDiam+6+moldWallThickness*2,d1=maxDiam+6+moldWallThickness*2);
translate ([0,0,h]) cylinder(straightHeight,d2=maxDiam+6,d1=maxDiam+6);
cylinder(h,d2=maxDiam,d1=minDiam);

}

//Main cone
difference(){
cylinder(h,d2=maxDiam+6+moldWallThickness*2,d1=minDiam+moldWallThickness*2);
cylinder(h,d2=maxDiam,d1=minDiam);

}

//Straight bottom part
translate ([0,0,-straightHeightBottom]) difference(){
cylinder(straightHeightBottom,d2=minDiam+moldWallThickness*2,d1=minDiam+moldWallThickness*2);
cylinder(straightHeightBottom,d2=minDiam,d1=minDiam);

}

//Bottom and foot
translate ([0,0,-straightHeightBottom-bottomThickness]) cylinder(bottomThickness,d2=footDiam,d1=footDiam);

////Screw holders at 1st side////

translate([0,-moldWallThickness,0]){

//Holes    
difference(){
translate ([(minDiam+maxDiam)/4-moldWallThickness,0,-straightHeightBottom-bottomThickness]) cube([assemblyWidth,moldWallThickness*2,h+straightHeightBottom+bottomThickness+straightHeight]); //Long plate
   
d=(h+straightHeightBottom+bottomThickness+straightHeight-40)/numberOfHoles; //Distance between holes

for(k = [0:numberOfHoles]){
rotate(90, [1, 0, 0]) translate ([(minDiam+maxDiam)/4-moldWallThickness+12+4.5*(k/numberOfHoles),-straightHeightBottom+20+(k)*d,-moldWallThickness]) 
cylinder(moldWallThickness*2,d2=screwSize,d1=screwSize);
}

cylinder(h,d2=maxDiam,d1=minDiam); //Remove inner parts of cone again
translate ([0,0,h]) cylinder(straightHeight,d2=maxDiam+6,d1=maxDiam+6); //Remove inner parts of top again
translate ([0,0,-straightHeightBottom]) cylinder(straightHeightBottom,d2=minDiam,d1=minDiam);//Remove inner parts of bottom again
}

}

////Screw holders at 2nd side////

rotate(180, [0,0,1]){
    
//Holes    
difference(){
translate ([(minDiam+maxDiam)/4-moldWallThickness,-moldWallThickness,-straightHeightBottom-bottomThickness]) cube([assemblyWidth,moldWallThickness*2,h+straightHeightBottom+bottomThickness+straightHeight]); //Long plate
   
d=(h+straightHeightBottom+bottomThickness+straightHeight-40)/numberOfHoles; //Distance between holes

for(k = [0:numberOfHoles]){
rotate(90, [1, 0, 0]) translate ([(minDiam+maxDiam)/4-moldWallThickness+12+4.5*(k/numberOfHoles),-straightHeightBottom+20+(k)*d,-moldWallThickness]) 
cylinder(moldWallThickness,d2=screwSize,d1=screwSize);
}

cylinder(h,d2=maxDiam,d1=minDiam); //Remove inner parts of cone again
translate ([0,0,h]) cylinder(straightHeight,d2=maxDiam+6,d1=maxDiam+6); //Remove inner parts of top again
translate ([0,0,-straightHeightBottom]) cylinder(straightHeightBottom,d2=minDiam,d1=minDiam);//Remove inner parts of bottom again

}

}

}

translate ([-footDiam/2,0,-straightHeightBottom-bottomThickness]) cube([footDiam,footDiam,h+straightHeight+straightHeightBottom+bottomThickness]); //Cut half of the mold off (the side on the positive part of the y-axis)
    

//Make cutout at bottom for LDR holder
translate ([0,0,-straightHeightBottom]) cylinder(LDRHolderThickness,d2=LDRHolderDiam,d1=LDRHolderDiam);

}
