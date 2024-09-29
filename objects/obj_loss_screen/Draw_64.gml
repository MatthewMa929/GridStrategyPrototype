draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);
draw_text(room_width/2, room_height/2, "You Lost!");

draw_set_color(c_white);
draw_text(room_width/2, room_height/2 + 50, "Press any key to restart");

draw_set_alpha(1);  // Reset alpha for other drawing operations