// Controls the game state turn switching
// This currently is not doing anything
if (global.game_state.turn == "player") {
	move_timer = game_get_speed(gamespeed_fps) * 3;
} else if (global.game_state.turn == "enemy") {
	// temporary: just switch back to the players turn every 3 seconds.
	if (move_timer > 0) {
		move_timer--;
	} else {
		global.game_state.turn = "player";
	}
}