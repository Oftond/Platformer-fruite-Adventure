event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = spr_plant_idle;
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
	
	case STATES.ATTACK:
		sprite_index = spr_plant_attack;
		if (image_index >= 5)
		{
			if (!is_shoot)
			{
				is_shoot = true;
				with (instance_create_depth(bbox_left, y - 6, -999, obj_plant_bullet))
				{
					hspeed = 10 * -other.dir;
				}
			}
		}
		if (image_index >= sprite_get_number(sprite_index) - 1)
		{
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
}