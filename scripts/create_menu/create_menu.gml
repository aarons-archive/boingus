function create_menu(elements) {
	
	var width = max_nested_array_length(elements)
	var height = array_length(elements)

	var grid_id = ds_grid_create(width, height);
	
	for (var _x = 0; _x < height; _x++) {
		show_debug_message(_x)
		for (var _y = 0; _y < width; _y++) {
			show_debug_message(_y)
			grid_id[# _y, _x] = elements[_x, _y] 
		}
	}
	
	return grid_id;
}
