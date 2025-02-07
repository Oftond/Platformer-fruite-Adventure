event_inherited();

is_touch = false;
wait_time = 10;
wait_timer = 0;

mask_index = sprite_index;

press = function()
{
	if (!is_touch && sprite_index != spr_end_pressed)
	{
		sprite_index = spr_end_pressed;
		is_touch = true;
		wait_timer = wait_time;
		obj_game_manager.is_end_level = true;
		instance_create_layer(0, 0, "GUI", obj_transition);
		global.RoomData = { };
		global.RespownX = -1;
		global.RespownY = -1;
		global.Score += score;
	}
}