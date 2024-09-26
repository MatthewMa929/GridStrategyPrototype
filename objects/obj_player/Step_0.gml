//Temporary Movement, will ask obj_move_manager before moving
var move_x = 0;
var move_y = 0;


if (keyboard_check_pressed(ord("W"))){
	move_y = -1;
}
if (keyboard_check_pressed(ord("S"))){
	move_y = 1;
}
if (keyboard_check_pressed(ord("A"))){
	move_x = -1;
}
if (keyboard_check_pressed(ord("D"))){
	move_x = 1;
}

var move_success = false
if (global.game_state.turn == "player" && (move_x != 0 || move_y != 0)) {
	move_success = obj_move_manager.move_object(self, move_x, move_y);
}

if (move_success) {
	global.game_state.turn = "enemy";
}





