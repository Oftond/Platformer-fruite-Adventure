if (global.IsPause) exit;

event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = spr_blueBird_flying;
		image_speed = 1;
	break;
	
	case STATES.HIT:
		if (sprite_index != sprite_hit)
		{
			image_index = 0;
			sprite_index = sprite_hit;
		}
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
}