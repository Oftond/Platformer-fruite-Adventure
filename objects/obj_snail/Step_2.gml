event_inherited();

switch (state)
{
	case STATES.IDLE:
		if (current_hp == max_hp && sprite_index != spr_snail_idle)
		{
			image_speed = 1;
			sprite_index = spr_snail_idle;
			image_index = 0;
		}
		else if (current_hp > 1 && current_hp < max_hp && sprite_index != sprite_shell)
		{
			image_speed = 0;
			sprite_index = sprite_shell;
			image_index = 0;
		}
		else if (current_hp < max_hp && sprite_index != sprite_shell)
		{
			image_speed = 1;
			sprite_index = sprite_shell;
			image_index = 0;
		}
	break;
	
	case STATES.WALK:
		image_speed = 1;
		if (sprite_index != spr_snail_walk && current_hp == max_hp)
		{
			image_index = 0;
			sprite_index = spr_snail_walk;
		}
		else if (sprite_index != spr_snail_shell_idle && current_hp < max_hp)
		{
			image_index = 0;
			sprite_index = spr_snail_shell_idle;
		}
	break;
	
	case STATES.HIT:
		if (current_hp == max_hp - 1)
		{
			move_spd = 0;
			if (sprite_index != sprite_shell_hit)
			{
				sprite_index = sprite_shell_hit;
				image_index = 0;
			}
			if (image_index >= image_number - 1)
			{
				image_speed = 0;
				move_y = jump;
				state = STATES.IDLE;
			}
			if (!instance_exists(obj_snail_dead))
				instance_create_depth(x, y, depth, obj_snail_dead);
		}
		else if (current_hp < max_hp - 1)
		{
			image_speed = 1;
			move_spd = max_spd;
			if (sprite_index != sprite_shell_hit)
			{
				sprite_index = sprite_shell_hit;
				image_index = 0;
			}
			if (image_index >= image_number - 1 && current_hp > 0)
				state = STATES.IDLE;
			else if (image_index >= image_number - 1)
				image_speed = 0;
		}
	break;
	
	case STATES.WALL_HIT:
		image_speed = 1;
		if (sprite_index != sprite_shell_wall_hit)
		{
			sprite_index = sprite_shell_wall_hit;
			image_index = 0;
		}
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			state = STATES.IDLE;
		}
	break;
}