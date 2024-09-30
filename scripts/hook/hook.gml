// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hook(_dir_x, _dir_y, _owner, _target) {
	show_debug_message("HOOK")
	global.active_bullets++;
	proj = instance_create_layer(_owner.x, _owner.y, "Other", obj_hook)
	show_debug_message([_owner.x, _owner.y])
	show_debug_message([_dir_x, _dir_y])
	proj.dir_x = _dir_x
	proj.dir_y = _dir_y
	proj.owner = _owner
	proj.target = _target
}