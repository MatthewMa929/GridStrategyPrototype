if (alpha < 1) {
	alpha += fade_speed;
} else if (keyboard_check_pressed(vk_anykey)) {
	global.lv_amt = 0
	game_restart();
}
