/// @description Create variables


///////////
// Vars //
/////////
_move_speed		= 4		// Amount of pixels to move left or right by when moving.
_jump_height	= 7		// Amount of pixels to move up by when jumping.
_gravity		= 0.3	// Amount of pixels to move down by when falling.

_on_ground		= false // Whether the player is currently on the ground or not.
_jumped			= true  // Whether or not the player has jumped.

// A countdown from _coyote_max to zero which allows the player 
// to jump up to _coyote_max frames after losing contact with a 
// floor/ledge.
_coyote_counter = 0
_coyote_max		= 6

// A countdown from _buffer_max to zero in which pressing the 
// space bar will register a jump as long as you touch the floor
// within _buffer_max frames.
_buffer_counter = 0
_buffer_max		= 4

_horizontal_distance	= 0		// The amount of pixels to move horizontally, negative for left, positive for right.
_vertical_distance		= 0		// The amount of pixels to move vertically, negative for up, positive for down.

_dash_frames = 0
_dash_frames_max = 60
_dash_speed = 20
