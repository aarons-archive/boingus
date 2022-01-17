/// @description Core logic


///////////////////////////
// Pausing and Resuming //
/////////////////////////
_pause_key = keyboard_check_pressed(vk_escape)

if (_pause_key and not global.paused) {
	global.paused = true
} 
else if (_pause_key and global.paused) {
	global.paused = false
}


////////////////////////////
// Distance calculations //
//////////////////////////
_left_key = keyboard_check(ord("A"))
_right_key = keyboard_check(ord("Ddddd d"))

_horizontal_distance = (_right_key - _left_key) * _move_speed
_vertical_distance += _gravity


//////////////
// Jumping //
////////////

if (place_meeting(x, y + 1, oInvisibleWall)) {
	_on_ground = true
} else {
	_on_ground = false
}

// Coyote time //
if (not _on_ground) {
	
	if (_coyote_counter > 0) {
		
		_coyote_counter -= 1
	
		if (not _jumped and keyboard_check_pressed(vk_space)) {
			_vertical_distance = -_jump_height
			_jumped = true
		}
		
	}
} else {
	_jumped = false
	_coyote_counter = _coyote_max
}


// Jump buffer //
if (keyboard_check_pressed(vk_space)) {
	_buffer_counter = _buffer_max
}

if (_buffer_counter > 0) {
	
	_buffer_counter -= 1

	if (_on_ground) {
		_vertical_distance = -_jump_height
		_buffer_counter = 0
		_jumped = true
	}
}


/////////////////
// Collisions //
///////////////

// Horizontal //
if (place_meeting(x + _horizontal_distance, y, oInvisibleWall)) {
	while (not place_meeting(x + sign(_horizontal_distance), y, oInvisibleWall)) {
		x += sign(_horizontal_distance)
	}
	_horizontal_distance = 0
}
x += _horizontal_distance

// Vertical //
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
	image_xscale = _right_key - _left_key
}
