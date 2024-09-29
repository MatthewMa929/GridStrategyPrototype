//will move differently
//run from player if 1 tile adj
//will try to go to range to hit player
if global.game_state.turn == "enemy" {
	if obj_player.y == y and obj_player.x > x {
		shoot_or_move(1, 0)
		return;
	}
	else if obj_player.y == y and obj_player.x < x {
		shoot_or_move(-1, 0)
		return;
	}
	else if obj_player.x == x and obj_player.y < y {
		shoot_or_move(0, -1)
		return;
	}
	else if obj_player.x == x and obj_player.y > y {
		shoot_or_move(0, 1)
		return;
	}
	else {
		var _player_x = obj_player.x;
		var _player_y = obj_player.y;

		var move_x = 0;
		var movy_y = 0;
		var move_success = false;
	
		var dist_x = _player_x - x;
		var dist_y = _player_y - y;

		if (abs(dist_x) < abs(dist_y)) {
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
}