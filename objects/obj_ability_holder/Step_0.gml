if ability == "Shoot" {
	instance_create_layer(x, y, "Icons", obj_bullet)
}

var _disabled = (global.game_state.turn != "player");

if (!_disabled) {
	if (mouse_check_button_pressed(mb_left)) {
        if (mouse_x > x && mouse_x < x + sprite_width && mouse_y > y && mouse_y < y + sprite_height) {
			global.game_state.selected_action = "ability"
		}
    }
}

if (_disabled) {
    sprite_index = spr_ability_holder; // Draw it grayed out
} else if (global.game_state.selected_action == "ability") {
	sprite_index = spr_selected_ability_holder; // Draw it in green
} else {
	 sprite_index = spr_ability_holder; // Draw it normally
}