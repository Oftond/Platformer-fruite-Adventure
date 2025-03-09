event_inherited();
sprite_hit = spr_banny_hit;
sprite_idle = spr_banny_idle;
sprite_run = spr_banny_run;
sprite_jump = spr_banny_jump;
sprite_fall = spr_banny_fall;
move_spd = 5;
dir = choose(1, -1);
wait_time = 120;
can_jump = true;
jump_height = -22;
name = "banny";
is_detected_player = false;
distance_detection = 1000;

dected_player = function()
{
	if (is_detected_player) return;

	var _find_player = instance_nearest(x, y, obj_player);
	var _distance_to_player = distance_detection + 1;
	var _check_wall = noone;
	if (_find_player != noone)
	{
		_distance_to_player = point_distance(x, y, _find_player.x, _find_player.y);
		_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);
	}

	state = STATES.IDLE;

	if (_check_wall == noone && _distance_to_player <= distance_detection && (_find_player.y < (bbox_bottom) && _find_player.y > (bbox_top - 15)))
	{
		state = STATES.WALK;
		is_detected_player = true;
		if (x + 200 <= _find_player.x || x - 200 >= _find_player.x)
			dir = sign(x - _find_player.x) == 0 ? image_xscale : sign(_find_player.x - x);
	}
	else
		is_detected_player = false;
}

jump = function()
{
	if (!instance_exists(obj_player) || !is_detected_player) return;
	
	is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap) || place_meeting(x, y + 1, obj_game_manager.traps_layer_ice) || place_meeting(x, y + 1, obj_game_manager.traps_layer_sand);

	if (!is_graunded)
		move_y += grav;
	else if (!can_jump)
		can_jump = true;
		
	if (move_y < 0)
		state = STATES.JUMP;
	else if (move_y >= 0 && !is_graunded)
		state = STATES.FALL;

	var _sub_pixel = 0.5;
	if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
			y += _pixel_check;
		move_y = 0;
	}
	else if (place_meeting(x, y + move_y, obj_game_manager.traps_layer_sand))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_sand))
			y += _pixel_check;
		move_y = 0;
	}
	else if (place_meeting(x, y + move_y, obj_game_manager.traps_layer_ice))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_ice))
			y += _pixel_check;
		move_y = 0;
	}
	
	y += move_y;
}