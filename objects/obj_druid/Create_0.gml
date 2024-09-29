event_inherited();

ability = "Shoot"

function shoot_or_move(_dir_x, _dir_y) {
	if !check_for_wall(_dir_x, _dir_y) {
		shoot_bullet(_dir_x, _dir_y, obj_enemy)
	}
	else {
		move_closer()
	}
}

function move_closer() {
	var _player_x = obj_player.x;
	var _player_y = obj_player.y;

	var move_x = 0;
	var movy_y = 0;
	var move_success = false;
	
	var dist_x = _player_x - x;
	var dist_y = _player_y - y;

	if (abs(dist_x) > abs(dist_y)) {
		// if X is further, move in X first, then X
		move_success = move_and_check_x(dist_x > 0 ? 1 : -1);
		if (move_success) { end_enemy_turn(); return; }
		
		move_success = move_and_check_y(dist_y > 0 ? 1 : -1);
		if (move_success) { end_enemy_turn(); return; }
		
		move_success = move_and_check_x(dist_x > 0 ? -1 : 1);
		if (move_success) { end_enemy_turn(); return; }
		
		move_success = move_and_check_y(dist_y > 0 ? -1 : 1);
		if (move_success) { end_enemy_turn(); return; }
	} else {
		// if Y is further, move in Y first, then X
		move_success = move_and_check_y(dist_y > 0 ? 1 : -1);
		if (move_success) { end_enemy_turn(); return; }
		
		move_success = move_and_check_x(dist_x > 0 ? 1 : -1);
		if (move_success) { end_enemy_turn(); return; }
		
		move_success = move_and_check_y(dist_y > 0 ? -1 : 1);
		if (move_success) { end_enemy_turn(); return; }
		
		move_success = move_and_check_x(dist_x > 0 ? -1 : 1);
		if (move_success) { end_enemy_turn(); return; }
	}
}