/// @description Draw menu on screen.
if (! global.paused) {
	exit;
}

var global_width = global.view_width;
var global_height = global.view_height;


// Base
draw_rectangle_color(
	0, 0, global_width, global_height, 
	c_black, c_black, c_black, c_black, 
	false
);
