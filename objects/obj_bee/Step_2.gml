event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = spr_bee_idle;
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
	
	case STATES.ATTACK:
		image_speed = 1;
		if (sprite_index != spr_bee_attack)
		{
			image_index = 0;
			sprite_index = spr_bee_attack;
		}
		if (image_index >= image_number - 3 && !is_shoot)
		{
			with (instance_create_depth(x, bbox_bottom, -999, obj_bee_bullet))
				vspeed = 15;
			is_shoot = true;
		}
		if (image_index >= sprite_get_number(sprite_index) - 1)
		{
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
}