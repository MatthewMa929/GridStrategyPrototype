move_timer = 0;

max_hp = 5;
hp = max_hp;
atk = 3;


// helper function to move in the X direction and check success
function move_and_check_x(direction) {
    return obj_move_manager.move_object(self, direction, 0);
}

// helper function to move in the Y direction and check success
function move_and_check_y(direction) {
    return obj_move_manager.move_object(self, 0, direction);
}

function end_enemy_turn() {
	global.game_state.turn = "player";
	global.game_state.selected_action = "move";
}