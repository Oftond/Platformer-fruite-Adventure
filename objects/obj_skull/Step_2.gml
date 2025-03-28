if (global.IsPause) exit;

event_inherited();

switch (state)
{
	case STATES.IDLE:
		if (is_fire)
		{
			if (parts == pointer_null) parts = part_system_create_layer("GUI", false, Ps_FireSkull);
			sprite_index = sprite_idle_1;
			image_speed = 1;
		}
		else
		{
			if (parts != pointer_null)
			{
				part_system_destroy(parts);
				parts = pointer_null;
			}
			sprite_index = sprite_idle_2;
			image_speed = 1;
		}
	break;
	
	case STATES.HIT:
		if (sprite_index != sprite_hit)
		{
			sprite_index = sprite_hit;
			image_index = 0;
		}
		image_speed = 1;
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
	
	case STATES.WALL_HIT:
		if (!is_fire && current_hp > 0)
		{
			if (sprite_index != sprite_hit_wall_2)
			{
				sprite_index = sprite_hit_wall_2;
				image_index = 0;
			}
		}
		else if (is_fire && current_hp > 0)
		{
			if (sprite_index != sprite_hit_wall_1)
			{
				sprite_index = sprite_hit_wall_1;
				image_index = 0;
			}
		}
		else if (current_hp <= 0)
		{
			if (sprite_index != sprite_hit)
			{
				sprite_index = sprite_hit;
				image_index = 0;
			}
		}
		image_speed = 1;
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			state = STATES.IDLE;
		}
	break;
}