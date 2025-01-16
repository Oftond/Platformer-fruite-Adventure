event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = sprite_idle;
		image_speed = 1;
	break;
	
	case STATES.WALK:
		sprite_index = sprite_run;
		image_speed = 1;
	break;
	
	case STATES.ATTACK:
		image_speed = 1;
		if (sprite_index != sprite_attack)
		{
			image_index = 0;
			sprite_index = sprite_attack;
			with (instance_create_depth(x, y, depth, obj_chamelion_maskAttack))
			{
				image_xscale = other.image_xscale;
			}
		}
		if (image_index >= image_number - 1)
		{
			if (!is_death)
			{
				detected_player = false;
				state = STATES.IDLE;
				attack_timer = attack_delay;
			}
		}
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