x += dir_x * spd
y += dir_y * spd

if place_meeting(x, y, obj_wall) {
	instance_destroy()
}
else if place_meeting(x, y, target) {
	target.hp += -3
	instance_destroy()
}