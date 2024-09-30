x += dir_x * spd
y += dir_y * spd

if place_meeting(x, y, obj_wall) {
	instance_destroy()
}
else if place_meeting(x, y, target) {
	var target_hit = instance_place(x, y, target)
	target_hit.hp += -2
	audio_play_sound(snd_player_hurt, 0, false);
	instance_destroy()
	global.active_bullets--;
}