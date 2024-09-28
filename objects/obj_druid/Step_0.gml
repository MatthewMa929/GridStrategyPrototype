//will move differently
//run from player if 1 tile adj
//will try to go to range to hit player
if global.game_state.turn == "enemy" {
	if obj_player.y == y and obj_player.x > x {
		shoot_bullet(1, 0, obj_enemy)
		return;
	}
	else if obj_player.y == y and obj_player.x < x {
		shoot_bullet(-1, 0, obj_enemy)
		return;
	}
	else if obj_player.x == x and obj_player.y < y {
		shoot_bullet(0, -1, obj_enemy)
		return;
	}
	else if obj_player.x == x and obj_player.y > y {
		shoot_bullet(0, 1, obj_enemy)
		return;
	}
	else {
		//move
	}
}