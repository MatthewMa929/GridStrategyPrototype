if (place_meeting(x, y, obj_player)) {
	if (array_length(obj_ability_manager.slots) < 2) {
		array_push(obj_ability_manager.slots, ability);
	}
	obj_player.hp += 1
	instance_destroy();
}