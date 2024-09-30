x += dir_x * spd
y += dir_y * spd
visible = true

if place_meeting(x, y, obj_wall) {
	instance_destroy()
	global.active_bullets--;
}
else if place_meeting(x, y, target) {
	show_debug_message("HOOK HIT")
	var target_hit = instance_place(x, y, target)
	//pull target
	target_hit.x = owner.x + dir_x * global.grid_size
	target_hit.y = owner.y + dir_y * global.grid_size
	instance_destroy()
	global.active_bullets--;
}