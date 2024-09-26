if (place_meeting(x, y, obj_player) and 
array_length(obj_ability_manager.slots) < 2) {
	array_push(obj_ability_manager.slots, ability);
	instance_destroy();
}
