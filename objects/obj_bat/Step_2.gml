event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = sprite_idle;
		image_speed = 1;
	break;
		
	case STATES.WALK:
		if (image_index != sprite_fly)
		{
			image_speed = 1;
			sprite_index = sprite_fly;
		}
	break;
	
	case STATES.HIT:
		sprite_index = sprite_hit;
		image_speed = 1;
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
}