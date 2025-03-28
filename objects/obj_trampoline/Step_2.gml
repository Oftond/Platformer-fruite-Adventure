if (global.IsPause) exit;

switch (state)
{
	case STATES.IDLE:
		is_jump = false;
		sprite_index = spr_trampoline_idle;
	break;
	
	case STATES.HIT:
		sprite_index = spr_trampoline_jump;
		if (image_index == sprite_get_number(sprite_index) - 1)
			state = STATES.IDLE;
		with(obj_player)
		{
			if (image_index > 0 && !other.is_jump)
			{
				move_y = -other.jump_height_on;
				current_jumps--;

				if (jump_timer > 0)
					jump_timer = 0;
				other.is_jump = true;
			}
		}
	break;
}