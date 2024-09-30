if ability == "Shoot" {
	obj_icon.sprite_index = spr_bullet
	//instance_create_layer(x, y, "Icons", obj_bullet)
}

if ability == "Heavy Slam" {
	obj_icon.sprite_index = spr_heavy_slam
	//instance_create_layer(x, y, "Icons", obj_heavy_slam)
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