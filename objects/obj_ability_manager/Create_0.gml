//Heavy Slam: High damage attack
//Shoot: Attack horizontal or vertical any range
//Hook: Pull enemy to you or hook to a wall
ability_labels = ["Heavy Slam", "Shoot", "Hook"]

ability = "Shoot"

function shoot(_dir_x, _dir_y) {
	shoot_bullet(_dir_x, _dir_y, obj_player)
}