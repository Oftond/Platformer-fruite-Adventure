event_inherited();
switch (state)
{
	case STATES.IDLE:
		if (is_graunded)
		{
			sprite_index = sprite_idle_ground;
			image_speed = 1;
		}
		else
		{
			sprite_index = sprite_idle_fly;
			image_speed = 1;
		}
	break;
	
	case STATES.WALK:
		if (sprite_index != sprite_run)
		{
			sprite_index = sprite_run;
			image_index = 0;
			image_speed = 1;
		}
	break;
	
	case STATES.HIT:
		if (sprite_index != sprite_hit)
		{
			sprite_index = sprite_hit;
			image_index = 0;
		}
		image_speed = 1;
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
}