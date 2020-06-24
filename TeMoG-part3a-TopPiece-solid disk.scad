//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Part 3a - Top Piece - solid disk version

$fn=30; //Set to 200 when generating the molds for 3D printing

//Main cone and mold
minDiam = 35; //Cone

//Bottom
straightHeightBottom = 20;
bottomThickness=4;
LDRHolderThickness= 10-0.5;
LDRHolderDiam= minDiam+3-1;
delta=0.4; //Inaccuracy of printer (layering and overextrusion)

rotate (60) translate ([0,0,-straightHeightBottom]) cylinder(LDRHolderThickness-delta,d2=LDRHolderDiam-delta,d1=LDRHolderDiam-delta);
    