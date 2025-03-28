if (global.IsPause) exit;

event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = sprite_idle;
		image_speed = 1;
	break;
	
	case STATES.APPEAR:
		if (sprite_index != sprite_appear)
		{
			sprite_index = sprite_appear;
			image_index = 0;
			image_speed = 1;
		}
		if (image_index >= image_number - 1)
			state = STATES.IDLE;
	break;
	
	case STATES.DESAPPEAR:
		if (sprite_index != sprite_desappear)
		{
			sprite_index = sprite_desappear;
			image_index = 0;
			image_speed = 1;
		}
		if (image_index >= image_number - 1)
			image_speed = 0;
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