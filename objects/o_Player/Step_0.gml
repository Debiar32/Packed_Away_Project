// Input checks
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var drive = keyboard_check(vk_up);
var reverse = keyboard_check(vk_down);
var drift = keyboard_check_pressed(ord("Z"));

// Speed variables
if(drift){
	frc = 0.01;
	max_sp = 6;
	steering = 4;
	
	}
else if(!drift) {
	frc = .2;
	max_sp = 3;
	steering = 2;
	
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
