/// @description Insert description here
// You can write your code in this edito
var dist = point_distance(x,y,o_Player.x,o_Player.y);
var Rot = point_direction(x,y,o_Player.x,o_Player.y);
image_angle = Rot;
direction = image_angle;


if(dist <= chase_dist){
speed = msp;
}
else if(dist >= chase_dist){
speed = 0;
}