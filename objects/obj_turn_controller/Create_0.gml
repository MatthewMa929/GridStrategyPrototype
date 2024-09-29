// Handles player and enemy turns
enemy_queue = ds_queue_create();
current_enemy = noone;
enemy_turn_in_progress = false;

alarm[0] = -1;