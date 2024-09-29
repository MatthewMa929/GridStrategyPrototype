// UI for player making an attack
var _button_text = "Attack";
var _disabled = (global.game_state.turn != "player");

if (!_disabled) {
	if (mouse_check_button_pressed(mb_left)) {
        if (mouse_x > x && mouse_x < x + sprite_width && mouse_y > y && mouse_y < y + sprite_height) {
			global.game_state.selected_action = "attack"
		}
    }
}

if (_disabled) {
    draw_sprite_ext(spr_ui_button, 0, x, y, 1, 1, 0, c_gray, 1); // Draw it grayed out
} else if (global.game_state.selected_action == "attack") {
	draw_sprite_ext(spr_ui_button, 0, x, y, 1, 1, 0, c_lime, 1); // Draw it in green
} else {
	 draw_sprite(spr_ui_button, 0, x, y); // Draw it normally
}

draw_set_color(c_black)
draw_text(x + (sprite_width / 2) - string_width(_button_text) / 2,
          y + (sprite_height / 2) - string_height(_button_text) / 2,
          _button_text);