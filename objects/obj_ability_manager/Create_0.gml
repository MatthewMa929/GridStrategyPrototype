//Heavy Slam: High damage attack
//Shoot: Attack horizontal or vertical any range
//Hook: Pull enemy to you or hook to a wall
ability_labels = ["Heavy Slam", "Shoot", "Hook"]

ability = "None"

function shoot(_dir_x, _dir_y) {
	shoot_bullet(_dir_x, _dir_y, obj_player)
	ability = "None"
}

function slam(_dir_x, _dir_y) {
	//show_debug_message("HEAVY SLAM")
	//enemy = instance_place(obj_player.x+(_dir_x*global.grid_size), obj_player.y+(_dir_y*global.grid_size), obj_enemy)
	//show_debug_message(enemy)
	//if enemy {
	//	show_debug_message("ENEMY SLAMMED")
	//	enemy.hp += -10
	//}
	var grid_x = floor(obj_player.x / global.grid_size) * global.grid_size;
	var grid_y = floor(obj_player.y / global.grid_size) * global.grid_size;
	
	var check_x = grid_x + (_dir_x * global.grid_size);
	var check_y = grid_y + (_dir_y * global.grid_size);
		
	var enemy_hit = noone;
	with(obj_enemy) {
		if (x >= check_x && x < check_x + global.grid_size && y >= check_y && y < check_y + global.grid_size) {
	        show_debug_message("Enemy detected at: x = " + string(x) + ", y = " + string(y));
			enemy_hit = id;
			break;
		}
	}
	
	if (enemy_hit == noone) {
		return false;
	} else {
		with(enemy_hit) {
	        hp -= 10;
			audio_play_sound(snd_player_hurt, 1, false)
			
			// Emit 10 _dir particles
			var ps_instance = instance_nearest(x, y, obj_particle_system);
			if (ps_instance != noone) {
				ps_instance.emit_particles(check_x + 32, check_y + 32, 10); 
			}
	
		}
	}

	ability = "None"
}