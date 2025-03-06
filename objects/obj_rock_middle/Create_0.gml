event_inherited();

sprite_run = spr_rock_2_run;
sprite_idle = spr_rock_2_idle;
sprite_hit = spr_rock_2_hit;
move_spd = 2;
dir = choose(1, -1);
wait_time = 120;
name = "rock2";

death_time = 5;
create_small_rocks = false;

walk = function()
{
	move_x = move_spd * dir;
	
	is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap) || place_meeting(x, y + 1, obj_game_manager.traps_layer_ice) || place_meeting(x, y + 1, obj_game_manager.traps_layer_sand);
	
	if (!is_graunded)
	{
		move_y += grav;
	}
	
	if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap) || (place_empty(x + 150 * dir, y + 50, obj_game_manager.collision_tilemap) && place_empty(x + 150 * dir, y + 50, obj_game_manager.traps_layer_sand) && place_empty(x + 150 * dir, y + 50, obj_game_manager.traps_layer_ice)))
	{
		move_x = 0;
		if (state != STATES.HIT) state = STATES.IDLE;
		if (wait_timer <= 0)
		{
			wait_timer = wait_time;
		}
	}
	
	var _sub_pixel = 0.5;
	if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
			y += _pixel_check;
		move_y = 0;
	}

	if (place_meeting(x, y + move_y, obj_game_manager.traps_layer_ice))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_ice))
			y += _pixel_check;
		move_y = 0;
	}
	
	if (place_meeting(x, y + move_y, obj_game_manager.traps_layer_sand))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_sand))
			y += _pixel_check;
		move_y = 0;
	}

	if (move_x != 0 && state != STATES.HIT) state = STATES.WALK;
	
	image_xscale = -dir;
	x += move_x;
	y += move_y;
}