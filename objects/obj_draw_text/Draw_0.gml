draw_set_font(fnt_normal)
draw_set_color(c_blue)
draw_text(obj_ability_holder.x, obj_ability_holder.y - 20, obj_ability_holder.ability)


draw_set_color(c_white)
draw_text(x, y, "Room " + string(global.lv_amt))