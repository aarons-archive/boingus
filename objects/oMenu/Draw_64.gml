/// @description Menu drawing

if (not global.paused) {
	exit
}

var menu = menus[page]					// Get the current menu page.
var menu_height = ds_grid_height(menu)	// Get the amount of elements in the menu page.

/////////////////////
// Main rectangle //
///////////////////

var menu_x1 = view_width / 5
var menu_y1 = view_height / 5
var menu_x2 = view_width - (view_width / 5)
var menu_y2 = view_height - (view_height / 5)

draw_roundrect_color(
	menu_x1, menu_y1, 
	menu_x2, menu_y2, 
	c_black, c_black, 
	false
)

/////////////////
// Menu names //
///////////////

draw_set_halign(fa_right)	// x, y will be on the right.
draw_set_valign(fa_middle)	// x, y will be in the middle.

var menu_name_x_offset			// Horizontal offset for when an element is selected.
var menu_name_y_offset	= 75	// Distance between each element vertically.
var menu_name_start_x	= (view_width / 2) - 100
var menu_name_start_y	= (view_height / 2) - (((menu_height - 1) / 2) * menu_name_y_offset)       

for (var i = 0; i < menu_height; i++) {

	if (selected_elements[page] == i) {
		menu_name_x_offset = 20 
		draw_set_color(c_orange)
	} else {
		menu_name_x_offset = 0;
		draw_set_color(c_red)
	}
	
	draw_text_transformed(
		menu_name_start_x - menu_name_x_offset, 
		menu_name_start_y + (i * menu_name_y_offset), 
		menu[# 0, i], 
		3, 3, 0
	)
}

////////////////////
// Dividing line //
//////////////////

/////////////////
// Menu items //
///////////////
