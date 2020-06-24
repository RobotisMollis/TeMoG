//////////////////////////////////////////////
//  ***TeMoG - Tentacle Mold Generator***   //
//  by Jonas Jørgensen (jonj@sdu.dk) 2020   //
//                                          //
//  Shared under a Creative Commons         //
//  Attribution-ShareAlike (CC BY-SA 3.0)   //
//  license                                 //
//////////////////////////////////////////////

//Guide to adjust winding distance when fiber reinforcing the tentacle

$fn=30;

length=200;
width=10;
thickness=3;
threadspace=2;
betweenThreads=3;



difference(){
cube([length, width, thickness*2]);
for(i = [0:(threadspace+betweenThreads):length]) {
    translate([i,0,0]) cube([threadspace, width, thickness]);
    }

}
