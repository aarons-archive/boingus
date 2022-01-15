function max_nested_array_length(array) {
	
	var max_size = 0

	for (var i = 0; i < array_length(array); i++) {
		max_size = max(max_size, array_length(array[i]))
	}
	
	return max_size
};