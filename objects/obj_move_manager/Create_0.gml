//In charge of player movement and enemy movement
//Will deny player movement if impossible (Ex: Hit wall)
move_timer = 0; // temporary

function move_object(obj, move_x, move_y) {
	var grid_x = floor(obj.x / global.grid_size) * global.grid_size;
	var grid_y = floor(obj.y / global.grid_size) * global.grid_size;
	
	var new_x = grid_x + (move_x * global.grid_size);
	var new_y = grid_y + (move_y * global.grid_size);
	
	show_debug_message("Attempted new position: " + string(new_x) + ", " + string(new_y));
	
	with(obj_wall) {
		if (x >= new_x && x < new_x + global.grid_size && y >= new_y && y < new_y + global.grid_size) {
			return false;
		}
	}
	
	obj.x = new_x;
	obj.y = new_y;
	return true;
}

function attack_object(obj, attack_x, attack_y) {
	var grid_x = floor(obj.x / global.grid_size) * global.grid_size;
	var grid_y = floor(obj.y / global.grid_size) * global.grid_size;
	
	var check_x = grid_x + (attack_x * global.grid_size);
	var check_y = grid_y + (attack_y * global.grid_size);
		
	with(obj_enemy) {
		if (x >= check_x && x < check_x + global.grid_size && y >= check_y && y < check_y + global.grid_size) {
	        show_debug_message("Enemy detected at: x = " + string(x) + ", y = " + string(y));
	        obj_enemy.hp -= obj_player.atk;
			
			// Emit 10 attack particles
			var ps_instance = instance_nearest(x, y, obj_particle_system);
			if (ps_instance != noone) {
				ps_instance.emit_particles(check_x + 32, check_y + 32, 10); 
			}
	
	        return true;
		}
	}

	return false;
}

function attack_particles(target_x, target_y) {
	
}


