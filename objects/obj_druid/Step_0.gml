//will move differently
//run from player if 1 tile adj
//will try to go to range to hit player
if hp <= 0 {
	var _soul = instance_create_layer(x, y, "Other", obj_soul)
	_soul.ability = ability
	instance_destroy()
}
