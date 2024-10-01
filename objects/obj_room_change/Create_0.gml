rm_arr = [rm_test, rm_lv2, rm_lv3, rm_lv4]
rand_rm_ind = irandom_range(0, array_length(rm_arr))

function next_room() {
	obj_player.x = 64
	obj_player.y = 64
	global.game_state.turn = "player"
	global.lv_amt += 1
	room_restart()
	if global.lv_amt > 3 {
		room_goto(rand_rm_ind)
	}
	else {
		room_goto_next()
	}
	//room_restart()
}