event_inherited();

max_hp = 3
hp = max_hp
atk = 3

ability = "Shoot"

function shoot_or_move(_dir_x, _dir_y) {
	if !check_for_wall(_dir_x, _dir_y) {
		shoot_bullet(_dir_x, _dir_y, obj_enemy)
	}
	else {
		move_closer()
	}
}