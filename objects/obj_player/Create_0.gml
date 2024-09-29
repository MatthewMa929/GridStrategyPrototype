max_hp = 10
hp = max_hp
atk = 3
state = "idle"

function end_player_turn() {
	show_debug_message(["PLAYER HEALTH: ", hp]);
	with (obj_turn_controller) {
		global.game_state.turn = "enemy";
		enemy_turn_in_progress = false;
		show_debug_message("Player turn ended. Switching to ENEMY turn.");
	}
	
	global.game_state.selected_action = "move";
}