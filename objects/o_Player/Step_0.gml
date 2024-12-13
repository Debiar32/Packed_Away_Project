// Input checks
var left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right = keyboard_check(vk_right)||keyboard_check(ord("D"));
var drive = keyboard_check(vk_up)||keyboard_check(ord("W"));
var reverse = keyboard_check(vk_down)||keyboard_check(ord("S"));
var drift = keyboard_check(ord("Z"))||keyboard_check(ord("Space"))

image_angle = direction;
if(place_meeting(x,y,Dirt_Patch)){
acceleration = 0.1;
debug_accel = "0.1";
frc = .07;


}
else if(place_meeting(x,y,Road_Tile) || place_meeting(x,y,Corner_Road))
{
acceleration = 0.2;
debug_accel = "0.2";
frc = .04;
steering = 2;
}
if (speed != 0) {
    if (left) {
        direction += steering;
    }
    if (right) {
        direction -= steering;
    }
}


switch(Current_Car_State)
{	case CarState.IDLE:
	debug_State = "IDLE";
	#region
		 if (speed > 0) {
        speed -= frc; // Gradual deceleration
		} else if (speed < 0) {
        speed += frc; // Gradual deceleration
			}
		
		#endregion
		if(drive||reverse){
		Current_Car_State = CarState.RUN;
		}
		break;
	case CarState.RUN: 
	debug_State = "RUN";
	#region
		if (drive && !reverse) {
    speed += acceleration; // Accelerate forward
} else if (reverse && !drive) {
    speed -= acceleration; // Reverse
} else {
    if (speed > 0) {
        speed -= frc; // Gradual deceleration
    } else if (speed < 0) {
        speed += frc; // Gradual deceleration
    }
}

// Clamp speed to a maximum and minimum
speed = clamp(speed, min_sp,max_sp); // Max speed is 3, min reverse speed is -2

// Turning logic
if (speed != 0) {
    if (left) {
        direction += steering;
    }
    if (right) {
        direction -= steering;
    }
}

// Move the car
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Rotate the car's image
image_angle = direction;#endregion
		if(drive == false && reverse == false){
		Current_Car_State = CarState.IDLE;
		}
		if(drift)
		{
			Current_Car_State = CarState.DRIFTING;
		}
		break;
	case CarState.DRIFTING:
		debug_State = "DRIFT";
		frc = .1;
		image_angle = direction;
		if(drive){
		speed = 5;
		Current_Car_State = CarState.RUN;
		}
		else if(!drive ||reverse){
			if (speed > 0) {
			speed -= frc; // Gradual deceleration
			} else if (speed < 0) {
			speed += frc; // Gradual deceleration
    }
		}
		steering = 4;
		if(left && speed != 0)
		{
			
			direction += steering;
		
		}
		if(right && speed != 0)
		{
			direction -= steering;
		}
		
		
		if(speed == 0){Current_Car_State = CarState.IDLE;}
		
		break	
		
		
		
		
		
	
}

/*
if(drift){
	frc = 0.01;
	max_sp = 6;
	steering = 4;
	drifting = true;
	
	}
else if(!drift) {
	frc = .2;
	max_sp = 3;
	steering = 2;
	drifting = false;
	
	}
if (drive && !reverse) {
    speed += 0.2; // Accelerate forward
} else if (reverse && !drive) {
    speed -= 0.2; // Reverse
} else {
    if (speed > 0) {
        speed -= frc; // Gradual deceleration
    } else if (speed < 0) {
        speed += frc; // Gradual deceleration
    }
}

// Clamp speed to a maximum and minimum
speed = clamp(speed, min_sp,max_sp); // Max speed is 3, min reverse speed is -2

// Turning logic
if (speed != 0) {
    if (left) {
        direction += steering;
    }
    if (right) {
        direction -= steering;
    }
}

// Move the car
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Rotate the car's image
image_angle = direction;
*/