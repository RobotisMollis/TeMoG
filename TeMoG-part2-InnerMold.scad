//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Part 2 - Inner Mold

$fn=30; //Set to 200 when generating the molds for 3D printing

//Main cone and mold
h = 180; //Cone height
maxDiam = 45; //Cone
minDiam = 35; //Cone
centerSolidDiam=10;
moldWallThickness = 3;
footDiam=100; //Foot for mold
siliconeThickness=3; //Outer
dividersThickness = 5;

//Interior
numberOfChambers=3;

//Top part
wireAttachmentYesNo=0; //Set to 1 to generate wire holder at the top of inner mold
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

union(){

//Three cone parts that make the inside chambers
difference(){
cylinder(h,d2=maxDiam-siliconeThickness*2,d1=minDiam-siliconeThickness*2);
cylinder(h,d2=centerSolidDiam,d1=centerSolidDiam);

for (i = [0:numberOfChambers]) { //Cut away parts to make separate chambers
rotate (i*360/numberOfChambers) translate ([0,-dividersThickness/2,0]) cube([maxDiam, dividersThickness,h], center=[0,0,0]);
}

}

//Top part
difference(){
translate ([0,0,h]) cylinder(straightHeight,d2=maxDiam+6-1,d1=maxDiam+6-1); 
translate ([0,0,h]) cylinder(straightHeight,d2=maxDiam+6-10,d1=centerSolidDiam);
}

if (wireAttachmentYesNo==1){
//Wire attachment
difference(){
translate ([0,0,h+straightHeight-(5/2)]) cube ([maxDiam+6-2, 8, 5], center=true);
translate ([0,0,h+straightHeight-5]) cylinder(5,d2=wiresDiameter,d1=wiresDiameter);
}
}

}
