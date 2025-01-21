if (wait_timer > 0)
	wait_timer--;
	
if (wait_timer <= 0 && is_touch)
	is_touch = false;
	
if (sprite_index == spr_start_move && image_index >= image_number - 1)
	sprite_index = spr_start;