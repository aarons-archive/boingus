/// @description Core logic


/////////////
// Inputs //
///////////
_left_key = keyboard_check(ord("A")) or keyboard_check(vk_left)
_right_key = keyboard_check(ord("D")) or keyboard_check(vk_right)
_jump_key = keyboard_check_pressed(vk_space)
_pause_key = keyboard_check_pressed(vk_escape)


////////////////////////
// Pause/resume game //
//////////////////////
if (_pause_key and not global.paused) {
	global.paused = true
} else if (_pause_key and global.paused) {
	global.paused = false
}


///////////////
// Movement //
/////////////

// Calculate direction (-1 for left and 1 for right) then 
// multiply by the movement speed to get the amount of 
// distance moved horizontally.
var _move = _right_key - _left_key
_horizontal_distance = _move * _move_speed

// Increase vertical distance by the gravity which will move
// the player down, but then check if they press the jump 
// key, in which case, decrease the vertical distance by 
// the jump height which will move them upwards.
_vertical_distance += _gravity
if (place_meeting(x + 1, y + 1, oInvisibleWall)) and (_jump_key) {
	_vertical_distance = -_jump_height
}
 
 
/////////////////
// Collisions //
///////////////

// Horizontal collisions
if (place_meeting(x + _horizontal_distance, y, oInvisibleWall)) {
	while (not place_meeting(x + sign(_horizontal_distance), y, oInvisibleWall)) {
		x += sign(_horizontal_distance)
	}
	_horizontal_distance = 0
}
x += _horizontal_distance

// Vertical collisions
if (place_meeting(x, y + _vertical_distance, oInvisibleWall)) {
	while (not place_meeting(x, y + sign(_vertical_distance), oInvisibleWall)) {
		y += sign(_vertical_distance)
	}
	_vertical_distance = 0
}
y += _vertical_distance


/////////////////
// Animations //
///////////////
if (_horizontal_distance == 0) {
	sprite_index = sPlayerIdle
} else {
	sprite_index = sPlayerWalk
	image_xscale = sign(_horizontal_distance)
}
