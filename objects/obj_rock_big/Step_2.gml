if (current_hp <= 0 && !is_death)
{
	current_hp = 0;
	is_death = true;
}

switch (state)
{
	case STATES.IDLE:
		sprite_index = sprite_idle;
		image_speed = 1;
	break;
	
	case STATES.WALK:
		sprite_index = sprite_run;
		image_speed = 1;
	break;
	
	case STATES.HIT:
		if (image_index >= image_number - 1 && is_death && !create_middle_rocks)
		{
			create_middle_rocks = true;
			alarm[0] = death_time;
		}
		if (sprite_index != sprite_hit)
		{
			sprite_index = sprite_hit;
			image_index = 0;
		}
		image_speed = 1;
	break;
}