function dust_create(_part, _dir, _obj)
{
	if (cooldown_parts > 0) return;
	
	static part_system = part_system_create_layer("Environment", false);
	static part_type = part_type_create();
	var _direction = 1;
	
	if (_dir == -1) _direction = 360;
	else if (_dir == 1) _direction = 180;
	part_type_sprite(part_type, _part, false, false, false);
	part_type_size(part_type, 1, 2, -0.01, 0);
	part_type_scale(part_type, 1, 1);
	part_type_alpha3(part_type, 0, 1, 0);
	part_type_speed(part_type, 1, 3, -0.1, 0);
	part_type_direction(part_type, _direction, 180, 0, 0);
	part_type_orientation(part_type, 0, 360, 0, 0, true);
	part_type_life(part_type, 20, 30);
	part_type_gravity(part_type, -0.2, 270);
	
	if (_dir == -1 && part_system_exists(part_system)) part_particles_create(part_system, _obj.bbox_right, _obj.bbox_bottom, part_type, 1);
	if (_dir == 1 && part_system_exists(part_system)) part_particles_create(part_system, _obj.bbox_left, _obj.bbox_bottom, part_type, 1);
	
	cooldown_parts = max_cooldown_time;
}

function dust_jump_create(_part, _obj)
{
	static part_system = part_system_create_layer("Environment", false);
	static part_type = part_type_create();

	part_type_sprite(part_type, _part, false, false, false);
	part_type_size(part_type, 1, 1.6, 0, 0);
	part_type_scale(part_type, 1, 1);
	part_type_alpha3(part_type, 0, 1, 0);
	part_type_speed(part_type, 5, 5, 0, 0);
	part_type_direction(part_type, 80, 100, 0, 0);
	part_type_life(part_type, 20, 30);
	
	if (part_system_exists(part_system))
		part_particles_create(part_system, _obj.x, _obj.bbox_bottom - 10, part_type, 6);
}