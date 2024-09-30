
if (global.game_state.turn == "enemy") {
	// if there are no enemies, keep it on player's turn
	if (instance_number(obj_enemy) == 0) {
        global.game_state.turn = "player";
		global.game_state.selected_action = "move";
        enemy_turn_in_progress = false;
        show_debug_message("No enemies. Staying on PLAYER turn.");
		return;
    }
	
	// add all enemies to queue
	if (!enemy_turn_in_progress) {
		enemy_turn_in_progress = true;
		ds_queue_clear(enemy_queue);
		with(obj_enemy) {
			ds_queue_enqueue(other.enemy_queue, id);
			show_debug_message("Queued: " + object_get_name(object_index));
		}
	}
	

	if (current_enemy == noone) {
		if (!ds_queue_empty(enemy_queue)) {
			// move each enemy
			current_enemy = ds_queue_dequeue(enemy_queue);
			show_debug_message("Moving enemy: " + object_get_name(current_enemy.object_index));
			
			
			if (current_enemy.object_index == obj_druid) {
				with(current_enemy) {
					move_druid();

				}
			} else {
				with(current_enemy) {
					move_closer();
					audio_play_sound(snd_enemy_move, 0, false);
				}
			}
			
			alarm_set(0, game_get_speed(gamespeed_fps) * .2);
		} else {
			// all enemies have moved
			global.game_state.turn = "player";
			global.game_state.selected_action = "move";
			enemy_turn_in_progress = false;
			show_debug_message("All enemies moved. Switching to PLAYER turn.");
		}
	}
}