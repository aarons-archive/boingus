/// @description Core logic

// Get player inputs
key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_jump = keyboard_check_pressed(vk_space)


// Movement 
var _move = key_right - key_left;
_horizontal_speed = _move * _walk_speed;
_vertical_speed += _gravity;
if (place_meeting(x, y + 1, oInvisibleWall)) and (key_jump) {
	_vertical_speed = -_jump_speed
}
 

// Horizontal collisions
if (place_meeting(x + _horizontal_speed, y, oInvisibleWall)) {
	while (!place_meeting(x + sign(_horizontal_speed), y, oInvisibleWall)) {
		x += sign(_horizontal_speed)
	}
	_horizontal_speed = 0
}
x += _horizontal_speed;


// Vertical collisions
if (place_meeting(x, y + _vertical_speed, oInvisibleWall)) {
	while (!place_meeting(x, y + sign(_vertical_speed), oInvisibleWall)) {
		y += sign(_vertical_speed)
	}
	_vertical_speed = 0
}
y += _vertical_speed;
