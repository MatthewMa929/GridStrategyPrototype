// attack particles
attack_particle_system = part_system_create();
particle_type = part_type_create();

// Set up particle properties
part_type_shape(particle_type, pt_shape_pixel); // Shape of the particles
part_type_size(particle_type, 1, 5, 1, 0.02); // Size range (min, max)
part_type_color3(particle_type, c_yellow, c_orange, c_red); // Initial color
part_type_alpha3(particle_type, .8, .5, 0); // Fade in (min, max)
part_type_life(particle_type, 20, 40); // Lifespan (min, max)
part_type_speed(particle_type, 2, 5, -.1, 0); // Speed (min, max)
part_type_direction(particle_type, 0, 360, 0, 0); // Direction range
part_type_gravity(particle_type, 0, 0); // No gravity

function emit_particles(emit_x, emit_y, amount) {
	show_debug_message("Emitting attack particles");
	var emitter = part_emitter_create(attack_particle_system);
	
	part_emitter_region(attack_particle_system, emitter, 
		emit_x - 5, emit_x + 5, 
		emit_y - 5, emit_y + 5, 
		ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(attack_particle_system, emitter, particle_type, 20);
	part_emitter_destroy(attack_particle_system, emitter);
}