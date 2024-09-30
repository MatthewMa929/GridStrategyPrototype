event_inherited();

max_hp = 2
hp = max_hp
atk = 2

ability = "Shoot"

function shoot_or_move(_dir_x, _dir_y) {
	if !check_for_wall(_dir_x, _dir_y) {
		audio_play_sound(snd_enemy_shoot, 0, false);
		shoot_bullet(_dir_x, _dir_y, self);
	}
	else {
		audio_play_sound(snd_enemy_move, 0, false);
		move_closer()
	}
}

function move_druid() {
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
			if (move_success) { return; }
		
			move_success = move_and_check_y(dist_y > 0 ? 1 : -1);
			if (move_success) { return; }
		
			move_success = move_and_check_x(dist_x > 0 ? -1 : 1);
			if (move_success) { return; }
		
			move_success = move_and_check_y(dist_y > 0 ? -1 : 1);
			if (move_success) { return; }
		} else {
			// if Y is further, move in Y first, then X
			move_success = move_and_check_y(dist_y > 0 ? 1 : -1);
			if (move_success) { return; }
		
			move_success = move_and_check_x(dist_x > 0 ? 1 : -1);
			if (move_success) { return; }
		
			move_success = move_and_check_y(dist_y > 0 ? -1 : 1);
			if (move_success) { return; }
		
			move_success = move_and_check_x(dist_x > 0 ? -1 : 1);
			if (move_success) { return; }
		}
	}
}