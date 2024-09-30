// Basic enemy AI movement to move in direction of player
if hp <= 0 {
	var _soul = instance_create_layer(x, y, "Other", obj_soul)
	_soul.ability = ability
	instance_destroy()
}