event_inherited();

is_touch = false;
wait_time = 10;
wait_timer = 0;
mask_index = sprite_index;
instance_create_layer(x, y, "Environment", obj_pointer_maskCollide);

moveAnim = function()
{
	if (!instance_exists(obj_player)) return;
	if (obj_player.move_x != 0 && !is_touch)
	{
		sprite_index = spr_start_move;
		is_touch = true;
		wait_timer = wait_time;
	}
}