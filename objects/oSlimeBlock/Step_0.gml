/// @description 

if (place_meeting(x, y - 1, oSlimePlayer) or place_meeting(x, y + 1, oPlayer)) {
	_decaying = true
}

if (_decaying) {
	_health -= 5
	image_yscale = _health / 100
}