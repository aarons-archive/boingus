// Remove health if player touches any side of death barrier.
if (
	place_meeting(x + 1, y, oSlimePlayer) or 
	place_meeting(x - 1, y, oSlimePlayer) or 
	place_meeting(x, y + 1, oSlimePlayer) or 
	place_meeting(x, y - 1, oSlimePlayer)
) {
	global.health -= 5
}