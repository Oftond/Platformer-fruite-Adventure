event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = spr_mushroom_idle;
		image_speed = 1;
	break;
	
	case STATES.WALK:
		sprite_index = spr_mushroom_run;
		image_speed = 1;
	break;
	
	case STATES.HIT:
		sprite_index = sprite_hit;
		if (image_index >= sprite_get_number(sprite_index) - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
}