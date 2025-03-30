function dust_create(_part, _dir, _obj)
{
	if (cooldown_parts > 0) return;
	
	var part_system = part_system_create_layer("SFX_dust", false);
	var part_type = part_type_create();
	var _direction = 1;
	
	if (_dir == -1) _direction = 360;
	else if (_dir == 1) _direction = 180;
	part_type_sprite(part_type, _part, false, false, false);
	part_type_size(part_type, 1, 1.6, -0.01, 0);
	part_type_scale(part_type, 1, 1);
	part_type_alpha3(part_type, 0, 1, 0);
	part_type_speed(part_type, 1, 3, -0.1, 0);
	part_type_direction(part_type, _direction, 180, 0, 0);
	part_type_orientation(part_type, 0, 360, 0, 0, true);
	part_type_life(part_type, 20, 30);
	part_type_gravity(part_type, -0.2, 270);
	
	if (_dir == -1 && part_system_exists(part_system)) part_particles_create(part_system, _obj.bbox_right - 20, _obj.bbox_bottom, part_type, 1);
	if (_dir == 1 && part_system_exists(part_system)) part_particles_create(part_system, _obj.bbox_left + 20, _obj.bbox_bottom, part_type, 1);
	
	cooldown_parts = max_cooldown_time;
}

function dust_jump_create(_part, _obj)
{
	var part_system = part_system_create_layer("SFX_dust", false);
	var part_type = part_type_create();

	part_type_sprite(part_type, _part, false, false, false);
	part_type_size(part_type, 0.2, 0.8, 0, 0);
	part_type_alpha3(part_type, 0, 1, 0);
	part_type_speed(part_type, 5, 5, 0, 0);
	part_type_direction(part_type, 70, 110, 0, 0);
	part_type_life(part_type, 20, 30);
	
	if (part_system_exists(part_system))
		part_particles_create(part_system, _obj.x, _obj.bbox_bottom - 10, part_type, 10);
}

function dust_landing_create(_part, _obj)
{
	var part_system = part_system_create_layer("SFX_dust", false);
	var part_type = part_type_create();
	var part_type2 = part_type_create();

	part_type_sprite(part_type, _part, false, false, false);
	part_type_size(part_type, 0.5, 1, 0, 0);
	part_type_alpha3(part_type, 0, 1, 0);
	part_type_speed(part_type, 5, 5, 0, 0);
	part_type_direction(part_type, 160, 170, 0, 0);
	part_type_life(part_type, 10, 15);

	part_type_sprite(part_type2, _part, false, false, false);
	part_type_size(part_type2, 0.5, 1, 0, 0);
	part_type_alpha3(part_type2, 0, 1, 0);
	part_type_speed(part_type2, 5, 5, 0, 0);
	part_type_direction(part_type2, 20, 10, 0, 0);
	part_type_life(part_type2, 10, 15);
	
	if (part_system_exists(part_system))
	{
		part_particles_create(part_system, _obj.bbox_left + 10, _obj.bbox_bottom + 5, part_type, 4);
		part_particles_create(part_system, _obj.bbox_right - 10, _obj.bbox_bottom + 5, part_type2, 4);
	}
}

function dust_jumpArrow_create(_part, _obj)
{
	var part_system = part_system_create_layer("SFX_dust", false);
	var part_type = part_type_create();

	part_type_sprite(part_type, _part, false, false, false);
	part_type_size(part_type, 0.6, 1, 0, 0);
	part_type_alpha3(part_type, 0, 1, 0);
	part_type_speed(part_type, 5, 5, 0, 0);
	part_type_direction(part_type, 70, 110, 0, 0);
	part_type_life(part_type, 20, 30);
	
	if (part_system_exists(part_system))
		part_particles_create(part_system, _obj.x, _obj.bbox_bottom, part_type, 6);
}