if (place_meeting(x, y, obj_player)) {
	obj_ability_manager.ability = ability
	obj_player.hp += 1
	instance_destroy();
}