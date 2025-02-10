event_inherited();
sprite_hit = spr_chicken_hit;
sprite_run = spr_chicken_run;
sprite_idle = spr_chicken_idle;
name = "chicken";
dir = choose(1, -1);
distance_detection = 1000;
move_spd = 7;
max_spd = move_spd;
is_detected_player = false;

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
		if (place_empty(x + _distance_to_player * sign(_find_player.x - x), y, obj_game_manager.collision_tilemap) && place_empty(x + _distance_to_player * sign(_find_player.x - x), y, obj_block))
			return;
		state = STATES.WALK;
		is_detected_player = true;
		if (x + 200 <= _find_player.x || x - 200 >= _find_player.x)
			dir = sign(x - _find_player.x) == 0 ? image_xscale : sign(_find_player.x - x);
	}
	else
		is_detected_player = false;
}

walk = function()
{
	if (is_detected_player && instance_exists(obj_player))
	{
		if (x + 200 <= obj_player.x || x - 200 >= obj_player.x)
			dir = sign(x - obj_player.x) == 0 ? image_xscale : sign(obj_player.x - x);
		state = STATES.WALK;
	}
	
	if (state == STATES.WALK)
		move_x = move_spd * dir;
	else
		move_x = 0;

	var _sub_pixel = 0.5;
	if (place_meeting(x + move_x, y - 5, obj_game_manager.collision_tilemap) || (place_empty(x + 100 * dir, y + 10, obj_game_manager.collision_tilemap) && place_empty(x + 100 * dir, y + 10, obj_block)))
	{
		move_x = 0;
		state = STATES.IDLE;
	}

	if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
			y += _pixel_check;
		move_y = 0;
	}

	x += move_x;
	y += move_y;

	image_xscale = -dir;
}