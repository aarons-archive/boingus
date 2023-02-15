function change_difficulty(difficulty) {
	switch (difficulty) {
		case "EASY":
			global.difficulty = game_difficulty.EASY
			break
		case "MEDIUM":
			global.difficulty = game_difficulty.MEDIUM
			break
		case "HARD":
			global.difficulty = game_difficulty.HARD
			break
	}
}