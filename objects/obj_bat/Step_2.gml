event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = sprite_idle;
		image_speed = 1;
	break;
		
	case STATES.WALK:
		if (sprite_index != sprite_fly)
		{
			image_speed = 1;
			sprite_index = sprite_fly;
			image_index = 0;
		}
	break;
	
	case STATES.CEILLING:
		if (sprite_index != sprite_celling_out)
		{
			image_speed = 1;
			sprite_index = sprite_celling_out;
			image_index = 0;
		}
		if (image_index >= image_number - 1)
		{
			state = STATES.WALK;
		}
	break;
	
	case STATES.HIT:
		if (sprite_index != sprite_hit)
		{
			image_index = 0;
			sprite_index = sprite_hit;
		}
		image_speed = 1;
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.WALK;
		}
	break;
}