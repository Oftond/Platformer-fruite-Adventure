if (global.IsPause) exit;

event_inherited();
switch (state)
{
	case STATES.IDLE:
		sprite_index = sprite_idle;
		image_speed = 1;
	break;
	
	case STATES.HIT:
		if (!hit_wall && sprite_index != sprite_hit)
		{
			sprite_index = sprite_hit
			image_index = 0;
		}
		else if (hit_wall && sprite_index != sprite_hit_wall)
		{
			sprite_index = sprite_hit_wall
			image_index = 0;
			hit_wall = false;
			move_y = 0;
			move_y -= jump_spd + 4;
			move_x = -dir * 6;
			alarm[0] = time_to_knockback;
		}
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
	
	case STATES.ATTACK:
		if (sprite_index != sprite_run)
		{
			image_index = 0;
			sprite_index = sprite_run;
			move_spd = max_spd;
		}
	break;
}