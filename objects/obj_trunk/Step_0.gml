if (is_death)
{
	image_angle += 3;
	exit;
}

move_x = move_spd * dir;

if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap) || (place_empty(x + 100 * dir, y + 50, obj_game_manager.collision_tilemap) && place_empty(x + 100 * dir, y + 50, obj_game_manager.traps_layer_sand) && place_empty(x + 100 * dir, y + 50, obj_game_manager.traps_layer_ice)))
{
	if (wait_timer <= 0)
	{
		dir *= -1;
		wait_timer = wait_time;
		state = STATES.IDLE;
	}
	move_x = 0;
}

var _find_player = instance_nearest(x, y, obj_player);
var _distance_to_player = shoot_range + 1;
var _check_wall = noone;
if (_find_player != noone)
{
	_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);
	_distance_to_player = point_distance(x, y, _find_player.x, _find_player.y);
}

if (_distance_to_player <= shoot_range && _check_wall == noone && state != STATES.HIT)
{
	if (y >= _find_player.y - sprite_get_height(sprite_index) && y <= _find_player.y + sprite_get_height(sprite_index) * 2 && sign(_find_player.x - x) == dir && image_xscale == -sign(dir))
	{
		if (state != STATES.ATTACK && !is_shoot)
			image_index = 0;
		if (!is_shoot)
			state = STATES.ATTACK;
		move_x = 0;
	}
}

if (shoot_timer > 0 && state == STATES.ATTACK)
{
	alarm[0] = shoot_timer;
	shoot_timer = 0;
}

if (wait_timer <= 0)
{
	image_xscale = -sign(dir);
	if (move_x != 0 && state != STATES.HIT)
		state = STATES.WALK;
	x += move_x;
}
else
	wait_timer--;