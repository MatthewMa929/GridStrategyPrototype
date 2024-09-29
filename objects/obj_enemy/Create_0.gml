move_timer = 0;

max_hp = 5;
hp = max_hp;
atk = 3;
check_x = x
check_y = y

turn_controller = instance_find(obj_turn_controller, 0);


// helper function to move in the X direction and check success
function move_and_check_x(direction) {
    return obj_move_manager.move_object(self, direction, 0);
}

// helper function to move in the Y direction and check success
function move_and_check_y(direction) {
    return obj_move_manager.move_object(self, 0, direction);
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

function check_for_wall(_dir_x, _dir_y) { //returns true if wall in projectile path
	check_x = x
	check_y = y
	while true {
		check_x += _dir_x * global.grid_size
		check_y += _dir_y * global.grid_size
		show_debug_message([obj_player.x, obj_player.y, check_x, check_y, "player"])
		if (position_meeting(check_x, check_y, obj_player)) {
			show_debug_message([check_x, check_y, "player"])
			return false
		}
		if (position_meeting(check_x, check_y, obj_wall)) {
			show_debug_message([check_x, check_y, "wall"])
			return true
		}
	}
}

