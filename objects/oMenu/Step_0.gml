/// @description Menu logic

if (not global.paused) {
	exit
}

up_key = keyboard_check_pressed(vk_up)
down_key = keyboard_check_pressed(vk_down)
enter_key = keyboard_check_pressed(vk_enter)

var menu = menus[page]					// Get the current menu page.
var menu_height = ds_grid_height(menu)	// Get the amount of elements in the menu page.

if (inputting) {
	switch (menu[# 1, selected_elements[page]]) {
		case element_type.SHIFT:
			var hinput = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
			if (hinput != 0) {
				menu[# 3, selected_elements[page]] += hinput;
				menu[# 3, selected_elements[page]] = clamp(menu[# 3, selected_elements[page]], 0, array_length(menu[# 4, selected_elements[page]]) - 1);
			}
			break;
		case element_type.SLIDER:
			break
		case element_type.TOGGLE:
			break
		case element_type.INPUT:
			break
	}
} else {
	var change = down_key - up_key
	if (change != 0) {
		// Change option
		selected_elements[page] += change
		// If we went down past the last option, go up to the first option.
		if (selected_elements[page] > menu_height - 1) selected_elements[page] = 0
		// If we went up past the first option, go down to the last option.
		if (selected_elements[page] < 0) selected_elements[page] = menu_height - 1
	}
}

if (enter_key) {
	
	switch (menu[# 1, selected_elements[page]]) {
		
		case element_type.RUN_SCRIPT:
			script_execute(menu[# 2, selected_elements[page]])
			break
		case element_type.CHANGE_PAGE:
			page = menu[# 2, selected_elements[page]]
			break

		case element_type.SHIFT:
		case element_type.SLIDER:
		case element_type.TOGGLE:
			if (inputting) {
				script_execute(menu[# 2, selected_elements[page]], menu[# 3, selected_elements[page]])
			}
			break
			
		case element_type.INPUT:
			inputting = not inputting
			break
	}
}
