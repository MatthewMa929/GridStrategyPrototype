move_timer = 0;

max_hp = 5;
hp = max_hp;
atk = 3;
check_x = x
check_y = y
ability = "Heavy Slam"

show_debug_message("Enemy Created")

turn_controller = instance_find(obj_turn_controller, 0);


// helper function to move in the X direction and check success
function move_and_check_x(direction) {
    return obj_move_manager.move_object(self, direction, 0);
}

// helper function to move in the Y direction and check success
function move_and_check_y(direction) {
    return obj_move_manager.move_object(self, 0, direction);
}

function check_melee() {
	var _player_x = obj_player.x;
	var _player_y = obj_player.y;

	var move_x = 0;
	var movy_y = 0;
	var move_success = false;
	
	var dist_x = _player_x - x;
	var dist_y = _player_y - y;
	
	// if enemy is directly next to player, perform melee attack
	show_debug_message(["DISTANCE TO PLAYER", dist_x, dist_y]);
	if ((abs(dist_x) == 64  &&  abs(dist_y) == 0) || (abs(dist_y) == 64  &&  abs(dist_x) == 0)) {
		var attack_direction_x = dist_x > 0 ? 1 : (dist_x < 0 ? -1 : 0);
        var attack_direction_y = dist_y > 0 ? 1 : (dist_y < 0 ? -1 : 0);
		
		melee_attack(attack_direction_x, attack_direction_y);
		audio_play_sound(snd_player_hurt, 0, false);
		return true;
	}
	return false
}

function move_closer() {
	var _player_x = obj_player.x;
	var _player_y = obj_player.y;

	var move_x = 0;
	var movy_y = 0;
	var move_success = false;
	
	var dist_x = _player_x - x;
	var dist_y = _player_y - y;
	
	// if enemy is directly next to player, perform melee attack
	show_debug_message(["DISTANCE TO PLAYER", dist_x, dist_y]);
	if ((abs(dist_x) == 64  &&  abs(dist_y) == 0) || (abs(dist_y) == 64  &&  abs(dist_x) == 0)) {
		var attack_direction_x = dist_x > 0 ? 1 : (dist_x < 0 ? -1 : 0);
        var attack_direction_y = dist_y > 0 ? 1 : (dist_y < 0 ? -1 : 0);
		
		melee_attack(attack_direction_x, attack_direction_y);
		audio_play_sound(snd_player_hurt, 0, false);
		return;
	}

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

function melee_attack(attack_x, attack_y) {
	var grid_x = floor(obj_player.x / global.grid_size) * global.grid_size;
	var grid_y = floor(obj_player.y / global.grid_size) * global.grid_size;
	
	//with(obj_player) {
	//    show_debug_message("Player detected at: x = " + string(obj_player.x) + ", y = " + string(obj_player.x));
	//    show_debug_message("ATTACK:" + string(atk))
	obj_player.hp -= atk;
			
		// Emit 10 attack particles
	var ps_instance = instance_nearest(x, y, obj_particle_system);
	if (ps_instance != noone) {
		ps_instance.emit_particles(obj_player.x + 32, obj_player.y + 32, 10); 
	}
	audio_play_sound(snd_player_hurt, 0, false);
	
	return true;
}

function check_for_wall(_dir_x, _dir_y) { //returns true if wall in projectile path
	check_x = x
	check_y = y
	
	// prevent infinite loop
	var max_loop = 20;
	var current = 0;
	
	
	while current < max_loop {
		check_x += _dir_x * global.grid_size
		check_y += _dir_y * global.grid_size
		show_debug_message([check_x, check_y])
		if (position_meeting(check_x, check_y, obj_player)) {
			show_debug_message([check_x, check_y, "player"])
			return false
		}
		if (position_meeting(check_x, check_y, obj_wall)) {
			show_debug_message([check_x, check_y, "wall"])
			return true
		}
		
		current++;
	}
	
	return true;
}

