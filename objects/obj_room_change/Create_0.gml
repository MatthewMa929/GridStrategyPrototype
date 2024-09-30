rm_arr = [rm_lv1, rm_lv2]
rand_rm_ind = irandom_range(0, array_length(rm_arr))

function next_room() {
	obj_player.x = 64
	obj_player.y = 64
	global.game_state.turn = "player"
	room_goto(rand_rm_ind)
	//room_restart()
}