if (alpha < 1) {
	alpha += fade_speed;
} else if (keyboard_check_pressed(vk_anykey)) {
	game_restart();
}
