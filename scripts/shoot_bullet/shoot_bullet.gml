// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shoot_bullet(_dir_x, _dir_y, _owner) {
	bullet = instance_create_layer(x, y, "Other", obj_bullet)
	bullet.dir_x = _dir_x
	bullet.dir_y = _dir_y
	if _owner == obj_player {
		bullet.target = obj_enemy
	}
	else if _owner == obj_enemy {
		bullet.target = obj_player
	}
}