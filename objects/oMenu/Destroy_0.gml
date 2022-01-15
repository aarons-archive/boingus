/// @description Menu reset

for (var i = 0; i < array_length(menus); i++) {
	ds_grid_destroy(menus[i])
}
