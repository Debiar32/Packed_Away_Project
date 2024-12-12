// Input checks
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var drive = keyboard_check(vk_up);
var reverse = keyboard_check(vk_down);
var drift = keyboard_check(ord("Z"));

image_angle = direction;

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
		image_angle = direction;
		speed = 10;
		
		if(left)
		{
			
			direction += 5;
			if(right){
			Current_Car_State = CarState.RUN;
			}	
		}
		if(right)
		{
			direction -= 5;
			if(left){
			Current_Car_State = CarState.RUN;
			
			}
			
			}
		alarm_set(0,2);
		Current_Car_State = CarState.RUN;
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