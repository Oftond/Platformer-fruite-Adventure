event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = spr_angrypig_idle;
		image_speed = 1;
	break;
	
	case STATES.WALK:
		sprite_index = spr_angrypig_walk;
		image_speed = 1;
	break;
		
	case STATES.ATTACK:
		if (move_spd <= increase_spd)
			move_spd += increase_spd;
		sprite_index = spr_angrypig_run;
		image_speed = 1;
	break;
	
	case STATES.HIT:
		if (sprite_index != sprite_hit)
		{
			image_index = 0;
			sprite_index = sprite_hit;
		}
		if (image_index >= sprite_get_number(sprite_index) - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.ATTACK;
		}
	break;
}