draw_self();

// player health
var bar_width = 30;
var bar_height = 3;
var bar_x = x + 16;
var bar_y = y - bar_height - 5;

var hp_percent = hp / max_hp;
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + bar_width * hp_percent, bar_y + bar_height, false);

