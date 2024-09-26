/// Draw GUI event for the turn indicator
var turn_text;
if (global.game_state.turn == "player") {
	turn_text = "Your turn"
} else if (global.game_state.turn == "enemy") {
	turn_text = "Enemy's turn"
}

draw_set_alpha(0.5)
draw_set_color(c_black);
draw_rectangle(12, 12, 120, 40, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_text(16, 16, turn_text);
