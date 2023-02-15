/// @description Draw menu

draw_set_font(fMainMenu)
draw_set_halign(fa_left)
draw_set_valign(fa_top)


var menu = menu_pages[menu_page]
var menu_height = ds_grid_height(menu)

var element_name_offset_x = 30
var element_name_offset_y = 80
var element_name_start_x = 650
var element_name_start_y = max(240, 440 - (((menu_height - 1) / 2) * element_name_offset_y))

for (var i = 0; i < menu_height; i++) {
	
	if (menu_selected_elements[menu_page] == i) {
		
		draw_set_color(c_white)
		draw_sprite(
			sArrow, 
			-1,
			element_name_start_x,
			element_name_start_y + (i * element_name_offset_y) + 12.5, 
		)
		draw_text(
			element_name_start_x + element_name_offset_x, 
			element_name_start_y + (i * element_name_offset_y), 
			menu[# 0, i], 
		)
	} 
	else {
		draw_set_color(c_grey)
		draw_text(
			element_name_start_x, 
			element_name_start_y + (i * element_name_offset_y), 
			menu[# 0, i], 
		)
	}
	
	switch (menu[# 1, i]) {
		
	case element_type.SHIFT:
	
		var current_value = menu[# 3, i]
			
		if (current_value == 0) { var left_shift = "" } else { var left_shift = "<< " } 
		if (current_value == array_length(menu[# 4, i]) - 1) { var right_shift = "" } else { var right_shift = " >>" }
			
		if (i == menu_selected_elements[menu_page]) {
			if (menu_inputting) { var colour = c_lime } else { var colour = c_white }
		} 
		else {
			var colour = c_grey
		}
			
		draw_text_color(
			element_name_start_x + 300, 
			element_name_start_y + (i * element_name_offset_y), 
			left_shift + menu[# 4, i][current_value] + right_shift,
			colour, colour, colour, colour, 
			1
		)
		break;
	}
}