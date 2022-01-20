// Set decaying to true if player touches any side of slime block
if (
	place_meeting(x + 1, y, oSlimePlayer) or 
	place_meeting(x - 1, y, oSlimePlayer) or 
	place_meeting(x, y + 1, oSlimePlayer) or 
	place_meeting(x, y - 1, oSlimePlayer)
) {
	_decaying = true
}


// If the current block is decaying, remove health and make it smaller vertically.
if (_decaying) {
	_health -= 5
	image_yscale = _health / 100
}