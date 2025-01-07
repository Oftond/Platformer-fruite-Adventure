switch(state)
{
	case STATES.IDLE:
		image_index = 0;
		sprite_index = spr_block_idle;
	break;
	
	case STATES.HIT:
		sprite_index = spr_block_hitTop;
		if (image_index == sprite_get_number(sprite_index) - 1)
			state = STATES.IDLE;
	break;
}