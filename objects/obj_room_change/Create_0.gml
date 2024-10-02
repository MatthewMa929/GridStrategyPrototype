rm_arr = [rm_lv1, rm_lv2, rm_lv3, rm_lv4]

function next_room() {
	obj_player.x = 64
	obj_player.y = 64
	global.game_state.turn = "player"
	global.lv_amt += 1
	room_restart()
	get_rand_room()
	if global.lv_amt > 3 {
		rand_rm_ind = rm_arr[global.lv_amt-1]
	}
	room_goto_next()
	//room_restart()
}

function get_rand_room() {
	rand_rm_ind = irandom_range(0, array_length(rm_arr))
}