if (global.IsPause) exit;

if (wait_timer > 0)
	wait_timer--;
	
if (wait_timer <= 0 && is_touch)
{
	if (instance_exists(obj_player))
		instance_destroy(obj_player);
	is_touch = false;
}

if (sprite_index == spr_end_pressed && image_index >= image_number - 1)
	sprite_index = spr_end_idle;