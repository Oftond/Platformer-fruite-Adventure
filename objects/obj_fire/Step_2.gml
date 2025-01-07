switch(state)
{
	case STATES.IDLE:
		sprite_index = spr_fire_off;
	break;
	
	case STATES.HIT:
		sprite_index = spr_fire_hit;
		if (image_index >= sprite_get_number(sprite_index) - 1)
		{
			image_speed = 0;
			if (time_to_attack == 0)
			{
				alarm[0] = max_time_to_attack;
				time_to_attack = max_time_to_attack;
			}
		}
	break;
	
	case STATES.ATTACK:
		sprite_index = spr_fire_on;
		if (time_attack <= 0)
			state = STATES.IDLE;
	break;
}