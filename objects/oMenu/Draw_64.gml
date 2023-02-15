/// @description Menu drawing

// Healthbar
var percentage = (global.health / global.max_health) * 100
draw_healthbar(
	view_width - 200,	0, 
	view_width,			40,
	percentage,
	c_black, c_red, c_lime,
	0, true, true
)
	
if (not global.paused) {
	exit
}

draw_set_font(fMenu)

var menu = menus[page]
var menu_height = ds_grid_height(menu)

var element_name_start_x = 20
var element_name_start_y = 20
var element_name_x_offset = 30
var element_name_y_offset = 80

var x2 = view_width - ((view_width / 3) * 2)
var y2 = element_name_start_y + (menu_height * element_name_y_offset)

draw_rectangle_color(
	0, 0, 
	x2, y2, 
	c_black, c_black, 
	c_black, c_black, 
	false
)

for (var i = 0; i < menu_height; i++) {
	
	var _x_offset

	if (i == selected_elements[page]) {
		_x_offset = element_name_x_offset
		draw_set_color(c_white)
		
		draw_sprite(
			sArrow, 
			-1,
			element_name_start_x,
			element_name_start_y + (i * element_name_y_offset) + 5, 
		)
	} 
	else {
		_x_offset = 0
		draw_set_color(c_red)
	}
	
	draw_text(
		element_name_start_x + _x_offset, 
		element_name_start_y + (i * element_name_y_offset), 
		menu[# 0, i], 
	)
}

/*
draw_set_color(c_white)
draw_line(
	(x2 / 3) + element_name_x_offset, 
	element_name_start_y, 
	(x2 / 3) + element_name_x_offset, 
	y2 - element_name_start_y
)

for (var i = 0; i < menu_height; i++) {
	switch (menu[# 1, i]) {
		
		case element.shift:
			var current_value = menu[# 3, i];
			var current_array = menu[# 4, i];
			var left_shift = "<< ";
			var right_shift = " >>";
			
			if (current_value == 0) {
				left_shift = "";
			}
			if (current_value == array_length(menu[# 4, i]) - 1) {
				right_shift = "";
			}
			
			c = c_white;			
			if (inputting and i == selected_elements[page]) {
				c = c_yellow;
			}
			
			draw_text_color(
				(x2 / 3) + (element_name_x_offset * 2), 
				element_name_start_y,
				left_shift + current_array[current_value] + right_shift, 
				c, c, c, c, 1
			);
			break;	
	}
}
*/
