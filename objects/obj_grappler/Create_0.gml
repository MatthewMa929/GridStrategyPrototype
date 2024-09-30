event_inherited()

ability = "Hook"

max_hp = 6
hp = max_hp
atk = 2

function hook_or_move(_dir_x, _dir_y) {
	if !check_for_wall(_dir_x, _dir_y) {
		audio_play_sound(snd_enemy_shoot, 0, false);
		hook(_dir_x, _dir_y, self, obj_player);
	}
	else {
		move_closer()
	}
}

function move_grappler() {
	if obj_player.y == y and obj_player.x > x {
		hook_or_move(1, 0)
		return;
	}
	else if obj_player.y == y and obj_player.x < x {
		hook_or_move(-1, 0)
		return;
	}
	else if obj_player.x == x and obj_player.y < y {
		hook_or_move(0, -1)
		return;
	}
	else if obj_player.x == x and obj_player.y > y {
		hook_or_move(0, 1)
		return;
	}
	else {
		move_closer()
	}
}