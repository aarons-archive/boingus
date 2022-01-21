/// @description Draw menu

draw_set_font(fMainMenu)
draw_set_halign(fa_left)
draw_set_valign(fa_top)


var menu = menu_pages[menu_page]
var menu_height = ds_grid_height(menu)

var element_name_start_x = 750
var element_name_start_y = 40
var element_name_offset_x = 30
var element_name_offset_y = 100

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
}