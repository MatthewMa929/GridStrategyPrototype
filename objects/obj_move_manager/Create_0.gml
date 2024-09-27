//In charge of player movement and enemy movement
//Will deny player movement if impossible (Ex: Hit wall)
grid_size = 64;

global.game_state = {
	turn: "player",
	selected_action: ""
}
move_timer = 0; // temporary

function move_object(obj, move_x, move_y) {
	var new_x = obj.x + (move_x * grid_size);
	var new_y = obj.y + (move_y * grid_size);
	
	show_debug_message("Attempted new position: " + string(new_x) + ", " + string(new_y));
	
	if (position_meeting(new_x, new_y, obj_wall)) {
		return false;
	}
	
	obj.x = new_x;
	obj.y = new_y;
	return true;
}

function attack_object(obj, attack_x, attack_y) {
	var grid_x = floor(obj.x / grid_size) * grid_size;
	var grid_y = floor(obj.y / grid_size) * grid_size;
	
	var check_x = grid_x + (attack_x * grid_size);
	var check_y = grid_y + (attack_y * grid_size);
		
	with(obj_enemy) {
		if (x >= check_x && x < check_x + grid_size && y >= check_y && y < check_y + grid_size) {
	        show_debug_message("Enemy detected at: x = " + string(x) + ", y = " + string(y));
	        instance_destroy();
	        return true;
		}
	}

	return false;
}


