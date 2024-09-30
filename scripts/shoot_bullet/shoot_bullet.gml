// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot_bullet(_dir_x, _dir_y, _owner) {
	global.active_bullets++;
	bullet = instance_create_layer(_owner.x, _owner.y, "Other", obj_bullet)
	bullet.dir_x = _dir_x
	bullet.dir_y = _dir_y
	if _owner.object_index == obj_player {
		bullet.target = obj_enemy
	}
	else {
		bullet.target = obj_player
	}
}