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
var _direction = (_right_key - _left_key)

if (place_meeting(x, y + 1, oSolid)) { _on_ground = true} else { _on_ground = false }


///////////
// Dash //
/////////
if (keyboard_check_pressed(ord("F")) and _direction != 0 and _dash_cooldown <= 0) {
	_dash_direction = _direction
	_dash_counter = _dash_max
	_dash_cooldown = _dash_cooldown_max
} 
if (_dash_cooldown > 0) {
	_dash_cooldown -= 1
}


///////////////
// Movement //
/////////////
if (_dash_counter > 0) {
	_horizontal_distance = _dash_direction * _dash_speed
	_vertical_distance = 0
	
	_dash_counter -= 1
} 
else {
	_horizontal_distance = _direction * _move_speed
	_vertical_distance += _gravity
	
	_dash_direction = 0
}


//////////////////
// Coyote time //
/////////////////
if (_on_ground) {
	_jumped = false
	_coyote_counter = _coyote_max
}

if (_coyote_counter > 0) {	
	
	_coyote_counter -= 1
	
	if (keyboard_check_pressed(vk_space) and not _jumped) {
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


////////////////////////////
// Horizontal collisions //
//////////////////////////
if (place_meeting(x + _horizontal_distance, y, oSolid)) {
	while (not place_meeting(x + sign(_horizontal_distance), y,  oSolid)) {
		x += sign(_horizontal_distance)
	}
	_horizontal_distance = 0
}
x += _horizontal_distance


//////////////////////////
// Vertical collisions //
////////////////////////
if (place_meeting(x, y + _vertical_distance,  oSolid)) {
	while (not place_meeting(x, y + sign(_vertical_distance),  oSolid)) {
		y += sign(_vertical_distance)
	}
	_vertical_distance = 0
}
y += _vertical_distance
