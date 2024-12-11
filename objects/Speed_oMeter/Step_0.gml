direction = Rot_sp;
image_angle = direction;
	
if(o_Player.speed != 0){
	Rot_sp -= .3;
}

if(Rot_sp <= 220){
	Rot_sp -= .1;
	
}

if(Rot_sp >= 330){Rot_sp += .1;}
