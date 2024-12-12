direction = Rot_sp;
image_angle = direction;
	
if(o_Player.acceleration != 0){
	while(Rot_sp <= 330){
	
	
	Rot_sp -= o_Player.acceleration;
	break;
	}
}

