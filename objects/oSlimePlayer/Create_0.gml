/// @description Create variables

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Basic variables:
//
_move_speed		= 4		// Amount of pixels to move left or right by when moving.
_jump_height	= 7		// Amount of pixels to move up by when jumping.
_gravity		= 0.3	// Amount of pixels to move down by when falling.
_on_ground		= false // Whether the player is currently on the ground or not.
_jumped			= true  // Whether or not the player has jumped.
/////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Coyote jumping:
// A small amount of frames after losing contact with a ledge/floor in which a player can still press 
// the jump key and jump.
//
_coyote_counter		= 0		// The amount of frames left before the coyote jump period runs out.
_coyote_max			= 8		// The amount of frames that the coyote jump period lasts for.
/////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Buffer jumping:
// A small amount of frames after pressing the jump key that causes the player to successfully jump 
// even if they were not yet touching the floor but made contact during the buffer period.
//
_buffer_counter		= 0		// The amount of frames left before the buffer period runs out.
_buffer_max			= 6		// The amount of frames that the buffer period lasts for.
/////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Dashing:
// A dash can only happen when the player is already actively moving in a direction. If they press the 
// jump key while this condition is met, the current direction will be stored and used to move the 
// player in that direction for (_dash_max) frames at a faster speed (_dash_speed).
//
_dash_counter		= 0		// The amount of frames left before the dash period runs out.
_dash_max			= 20	// The amount of frames that the dash period lasts.
_dash_speed			= 10    // The amount of pixels to move left or right by during a dash.
_dash_gravity		= 0.1	// The amount of pixels to move down by during a dash.
_dash_direction		= 0		// The direction of the dash, stops mid-dash direction changes.
/////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////
// Final movements: 
// Changes in the horizontal and vertical directions after calculating movement, jumping and dashing.
//
_horizontal_distance	= 0		// The amount of pixels to move horizontally.
_vertical_distance		= 0		// The amount of pixels to move vertically.
/////////////////////////////////////////////////////////////////////////////////////////////////////
