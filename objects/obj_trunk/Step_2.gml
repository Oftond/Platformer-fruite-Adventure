if (global.IsPause) exit;

event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = spr_trunk_idle;
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
		sprite_index = spr_trunk_attack;
		if (image_index >= 7)
		{
			if (!is_shoot)
			{
				is_shoot = true;
				switch(sign(dir))
				{
					case 1:
						with (instance_create_depth(bbox_right - 20, y + 7, -999, obj_trunk_bullet))
						{
							hspeed = 10 * other.dir;
							image_xscale = -other.dir;
						}
					break;
					
					case -1:
						with (instance_create_depth(bbox_left - 20, y + 7, -999, obj_trunk_bullet))
						{
							hspeed = 10 * other.dir;
							image_xscale = -other.dir;
						}
					break;
				}
			}
		}
		if (image_index >= sprite_get_number(sprite_index) - 1)
		{
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
	
	case STATES.WALK:
		sprite_index = spr_trunk_walk;
		image_speed = 1;
	break;
}