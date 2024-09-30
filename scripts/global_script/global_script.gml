window_set_fullscreen(true);
global.grid_size = 64

global.game_state = {
	turn: "player",
	selected_action: "move"
}
global.active_bullets = 0;
global.lv_amt = 0;

if global.active_bullets < 0 {
	global.active_bullets = 0
}