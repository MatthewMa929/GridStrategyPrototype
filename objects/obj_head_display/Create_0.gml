curr_x = x
curr_y = y


function display_heads(_head_arr) {
	for (var i = 0; i < array_length(_head_arr); i++) {
		var head = instance_create_layer(curr_x, curr_y, "Overlay",obj_head)
		head.image_index = _head_arr[i]
		curr_x += 80
	}
}

head_arr = [1, 1]
display_heads(head_arr)

function find_heads() {
	with(obj_enemy) {
		array_push(obj_head_display.head_arr, head_ind)
	}
}
//if obj_room_change.rand_rm_ind == rm_lv1 {
//	head_arr = [0, 0]
//	display_heads(head_arr)
//}
