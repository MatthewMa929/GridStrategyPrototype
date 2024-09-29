//Will ask obj_move_manager before moving
if (global.game_state.selected_action == "move") {
	var move_x = 0;
	var move_y = 0;


	if (keyboard_check_pressed(ord("W"))){
		move_y = -1;
	}
	if (keyboard_check_pressed(ord("S"))){
		move_y = 1;
	}
	if (keyboard_check_pressed(ord("A"))){
		move_x = -1;
	}
	if (keyboard_check_pressed(ord("D"))){
		move_x = 1;
	}
	if (keyboard_check_pressed(vk_space)) {
		alarm_set(0, game_get_speed(gamespeed_fps) * .5);
	}

	var move_success = false
	
	// forbid diagonal
	if (move_x != 0 && move_y != 0) {
		move_y = 0; 
	}
	
	if (global.game_state.turn == "player" && (move_x != 0 || move_y != 0)) {
		move_success = obj_move_manager.move_object(self, move_x, move_y);
	}

	if (move_success) {
		audio_play_sound(snd_player_move, 0, false);
		global.game_state.selected_action = "";
		alarm_set(0, game_get_speed(gamespeed_fps) * .5);
	}

}

if (global.game_state.selected_action == "attack") {
	var attack_x = 0;
	var attack_y = 0;


	if (keyboard_check_pressed(ord("W"))){
		attack_y = -1;
	}
	if (keyboard_check_pressed(ord("S"))){
		attack_y = 1;
	}
	if (keyboard_check_pressed(ord("A"))){
		attack_x = -1;
	}
	if (keyboard_check_pressed(ord("D"))){
		attack_x = 1;
	}
	
	var attack_success = false;
	
	// forbid diagonal
	if (attack_x != 0 && attack_y != 0) {
		attack_y = 0; 
	}
	
	if (global.game_state.turn == "player" && (attack_x != 0 || attack_y != 0)) {
		attack_success = obj_move_manager.attack_object(self, attack_x, attack_y);
	}
	
	if (attack_success) {
		state = "attack"
		global.game_state.selected_action = "";
		alarm_set(0, game_get_speed(gamespeed_fps) * .5);
	}
}

if max_hp < hp {
	hp = max_hp
}

// Animation states
switch (state) {
	case "idle":
		sprite_index = spr_hero_idle;
		image_speed = 1;
		break;
	case "attack":
		sprite_index = spr_hero_attack;
		image_speed = 1;
		
		if (image_index >= image_number - 1) {
			state="idle";
		}
		break;
}




