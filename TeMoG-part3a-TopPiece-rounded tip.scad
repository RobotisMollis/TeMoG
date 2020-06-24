//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Part 3b - Top Piece - rounded tip version

$fn=30; //Set to 200 when generating the molds for 3D printing

//Main cone and mold
minDiam = 35; //Cone


//Bottom
straightHeightBottom = 20;
LDRHolderThickness= 10-0.5; //*MODIFIED
LDRHolderDiam= minDiam+3-1;//*MODIFIED
delta=0.4; //Inaccuracy of printer (layering and overextrusion)

//Round top LDR holder
difference(){
rotate (60) translate ([0,0,-straightHeightBottom]) cylinder(LDRHolderThickness-delta,d2=LDRHolderDiam-delta,d1=LDRHolderDiam-delta);
translate([0,0,-straightHeightBottom/2]) scale([1,1,2*(LDRHolderThickness-delta)/(LDRHolderDiam-delta)]) sphere(r = (LDRHolderDiam-delta)/2);
}