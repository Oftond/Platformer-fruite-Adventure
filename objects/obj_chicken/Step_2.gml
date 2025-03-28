if (global.IsPause) exit;

event_inherited();

switch (state)
{
	case STATES.IDLE:
		sprite_index = sprite_idle;
		image_speed = 1;
	break;
	
	case STATES.HIT:
		if (sprite_index != sprite_hit)
		{
			sprite_index = sprite_hit
			image_index = 0;
		}
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
	
	case STATES.WALK:
		if (sprite_index != sprite_run)
		{
			image_index = 0;
			image_speed = 1;
			sprite_index = sprite_run;
		}
	break;
}