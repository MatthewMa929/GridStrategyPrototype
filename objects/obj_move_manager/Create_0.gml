//In charge of player movement and enemy movement
//Will deny player movement if impossible (Ex: Hit wall)
grid_size = 64;

global.game_state = {
	turn: "player"
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


