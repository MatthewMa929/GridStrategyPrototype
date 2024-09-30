if (mouse_check_button_pressed(mb_left)) {
    if (mouse_x > x && mouse_x < x + sprite_width && mouse_y > y && mouse_y < y + sprite_height) {
		global.game_state.turn = "enemy"
	}
}