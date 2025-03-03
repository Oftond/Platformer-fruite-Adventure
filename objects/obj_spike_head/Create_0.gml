dir = DIRECTIONS.LEFT;
move_spd = 2;
max_move_spd = 16;
move_x = 0;
move_y = 0;
wait_timer = 0;
wait_time = 60;
sprite_idle = sprite_index;
sprite_hit_left = spr_spike_head_left_hit;
sprite_hit_right = spr_spike_head_right_hit;
sprite_hit_top = spr_spike_head_top_hit;
sprite_hit_bottom = spr_spike_head_bottom_hit;
mode = 0;

change_all_dir = function()
{
	var _sub_pixel = 0.5;
	if ((tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) || tilemap_get_at_pixel(obj_game_manager.traps_layer_sand, bbox_left + move_x, y)) && dir == DIRECTIONS.LEFT)
	{
		var _pixel_check = _sub_pixel * sign(move_x);
		while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
			x += _pixel_check;
		move_x = 0;
		wait_timer = wait_time;
		set_hit_sprite(sprite_hit_left);
		dir = DIRECTIONS.TOP;
	}
	else if ((tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) || tilemap_get_at_pixel(obj_game_manager.traps_layer_sand, bbox_left + move_x, y)) && dir == DIRECTIONS.TOP)
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
			y += _pixel_check;
		move_y = 0;
		wait_timer = wait_time;
		set_hit_sprite(sprite_hit_top);
		dir = DIRECTIONS.RIGHT;
	}
	else if ((tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) || tilemap_get_at_pixel(obj_game_manager.traps_layer_sand, bbox_left + move_x, y)) && dir == DIRECTIONS.RIGHT)
	{
		var _pixel_check = _sub_pixel * sign(move_x);
		while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
			x += _pixel_check;
		move_x = 0;
		wait_timer = wait_time;
		set_hit_sprite(sprite_hit_right);
		dir = DIRECTIONS.BOTTOM;
	}
	else if ((tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) || tilemap_get_at_pixel(obj_game_manager.traps_layer_sand, bbox_left + move_x, y)) && dir == DIRECTIONS.BOTTOM)
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
			y += _pixel_check;
		move_y = 0;
		wait_timer = wait_time;
		set_hit_sprite(sprite_hit_bottom);
		dir = DIRECTIONS.LEFT;
	}
}

change_horizontal_dir = function()
{
	var _sub_pixel = 0.5;
	if ((tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) || tilemap_get_at_pixel(obj_game_manager.traps_layer_sand, bbox_left + move_x, y)) && dir == DIRECTIONS.LEFT)
	{
		var _pixel_check = _sub_pixel * sign(move_x);
		while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
			x += _pixel_check;
		move_x = 0;
		wait_timer = wait_time;
		set_hit_sprite(sprite_hit_left);
		dir = DIRECTIONS.RIGHT;
	}
	else if ((tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) || tilemap_get_at_pixel(obj_game_manager.traps_layer_sand, bbox_left + move_x, y)) && dir == DIRECTIONS.RIGHT)
	{
		var _pixel_check = _sub_pixel * sign(move_x);
		while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
			x += _pixel_check;
		move_x = 0;
		wait_timer = wait_time;
		set_hit_sprite(sprite_hit_right);
		dir = DIRECTIONS.LEFT;
	}
}

change_vertical_dir = function()
{
	var _sub_pixel = 0.5;
	if ((tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) || tilemap_get_at_pixel(obj_game_manager.traps_layer_sand, bbox_left + move_x, y)) && dir == DIRECTIONS.TOP)
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
			y += _pixel_check;
		move_y = 0;
		wait_timer = wait_time;
		set_hit_sprite(sprite_hit_top);
		dir = DIRECTIONS.BOTTOM;
	}
	else if ((tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) || tilemap_get_at_pixel(obj_game_manager.traps_layer_sand, bbox_left + move_x, y)) && dir == DIRECTIONS.BOTTOM)
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
			y += _pixel_check;
		move_y = 0;
		wait_timer = wait_time;
		set_hit_sprite(sprite_hit_bottom);
		dir = DIRECTIONS.TOP;
	}
}

set_hit_sprite = function(_sprite_hit)
{
	image_index = 0;
	sprite_index = _sprite_hit;
}