/// @description Core logic


///////////////////////////
// Pause, Resume, Reset //
/////////////////////////
var _pause_key = keyboard_check_pressed(vk_escape)

// Pause if not paused
if (_pause_key and not global.paused) {
	global.paused = true
} 
// Resume if paused
else if (_pause_key and global.paused) {
	global.paused = false
}
// Reset game
else if (keyboard_check_pressed(ord("R"))) {
	game_restart()
}


////////////
// Setup //
//////////
var _left_key = keyboard_check(ord("A"))
var _right_key = keyboard_check(ord("D"))

if (place_meeting(x, y + 1, oInvisibleWall)) { _on_ground = true} else { _on_ground = false }
if (_dash_counter > 0) { _is_dashing = true} else { _is_dashing = false }


////////////////////////////
// Distance calculations //
//////////////////////////

_horizontal_distance = (_right_key - _left_key) * _move_speed
_vertical_distance += _gravity


//////////////
// Jumping //
////////////

// Coyote time
if (_on_ground) {
	_jumped = false
	_coyote_counter = _coyote_max
} 
else if (_coyote_counter > 0) {
	
	_coyote_counter -= 1
	
	if (not _jumped and keyboard_check_pressed(vk_space)) {
		_coyote_counter = 0
		_jumped = true
		
		_vertical_distance = -_jump_height

	}	
}

/////////////////////
// Buffer jumping //
///////////////////
if (keyboard_check_pressed(vk_space)) {
	_buffer_counter = _buffer_max
}

if (_buffer_counter > 0) {
	
	_buffer_counter -= 1

	if (_on_ground) {
		_buffer_counter = 0
		_jumped = true
		
		_vertical_distance = -_jump_height	
	}
}


/////////////////
// Collisions //
///////////////

// Horizontal
if (place_meeting(x + _horizontal_distance, y, oInvisibleWall)) {
	while (not place_meeting(x + sign(_horizontal_distance), y, oInvisibleWall)) {
		x += sign(_horizontal_distance)
	}
	_horizontal_distance = 0
}
x += _horizontal_distance

// Vertical
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
if (_horizontal_distance != 0) {
	sprite_index = sSlimeMoving
	image_xscale = _right_key - _left_key
} else {
	sprite_index = sSlimeIdleSpecial
}
