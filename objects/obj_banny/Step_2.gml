if (global.IsPause) exit;

event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = sprite_idle;
		image_speed = 1;
	break;
		
	case STATES.WALK:
		if (image_index != sprite_run)
		{
			image_speed = 1;
			sprite_index = sprite_run;
		}
	break;
	
	case STATES.JUMP:
		if (image_index != sprite_jump)
		{
			sprite_index = sprite_jump;
			image_index = 0;
			image_speed = 1;
		}
	break;
	
	case STATES.FALL:
		if (image_index != sprite_fall)
		{
			sprite_index = sprite_fall;
			image_index = 0;
			image_speed = 1;
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
				state = STATES.IDLE;
		}
	break;
}