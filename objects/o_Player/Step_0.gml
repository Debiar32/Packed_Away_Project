// Input checks
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var drive = keyboard_check(vk_up);
var reverse = keyboard_check(vk_down);

// Speed variables
if (drive && !reverse) {
    speed += 0.2; // Accelerate forward
} else if (reverse && !drive) {
    speed -= 0.2; // Reverse
} else {
    if (speed > 0) {
        speed -= 0.1; // Gradual deceleration
    } else if (speed < 0) {
        speed += 0.1; // Gradual deceleration
    }
}

// Clamp speed to a maximum and minimum
speed = clamp(speed, -5, 5); // Max speed is 5, min reverse speed is -5

// Turning logic
if (speed != 0) {
    if (left) {
        direction += 2;
    }
    if (right) {
        direction -= 2;
    }
}

// Move the car
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Rotate the car's image
image_angle = direction;
