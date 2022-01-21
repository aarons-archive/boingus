/// @description Menu navigation/logic

var menu = menu_pages[menu_page]
var menu_height = ds_grid_height(menu)

var change = (keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up))

if (change != 0) {
	menu_selected_elements[menu_page] += change
	// If we went down past the last option, go up to the first option.
	if (menu_selected_elements[menu_page] > menu_height - 1) { menu_selected_elements[menu_page] = 0 }
	// If we went up past the first option, go down to the last option.
	if (menu_selected_elements[menu_page] < 0) { menu_selected_elements[menu_page] = menu_height - 1 }
}

if (keyboard_check_pressed(vk_enter)) {
	
	switch (menu[# 1, menu_selected_elements[menu_page]]) {
		case element_type.RUN_SCRIPT:
			script_execute(menu[# 2, menu_selected_elements[menu_page]])
			break
		case element_type.CHANGE_PAGE:
			menu_page = menu[# 2, menu_selected_elements[menu_page]]
			break
	}
	
}
