if (global.IsPause) exit;

if (is_death || state == STATES.HIT)
{
	image_angle += 3;
	exit;
}

var _find_player = instance_nearest(x, y, obj_player);
var _distance_to_player = shoot_range + 1;
var _check_wall = noone;
if (_find_player != noone)
{
	_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);
	_distance_to_player = point_distance(x, y, _find_player.x, _find_player.y);
}

if ((_distance_to_player <= shoot_range && _check_wall == noone && state == STATES.IDLE && count_shoot < max_count_shoot) || (is_detected_player && count_shoot < max_count_shoot && state == STATES.IDLE))
{
	if ((y >= _find_player.y - sprite_get_height(sprite_index) && y <= _find_player.y + sprite_get_height(sprite_index)) || is_detected_player)
	{
		if (dir == -1 && _find_player.x > x)
		{
			is_shoot = false;
			image_index = 0;
			state = STATES.ATTACK;
			count_shoot++;
			is_detected_player = true;
		}
		else if (dir == 1 && _find_player.x < x)
		{
			is_shoot = false;
			image_index = 0;
			state = STATES.ATTACK;
			count_shoot++;
			is_detected_player = true;
		}
	}
}

if (count_shoot >= max_count_shoot && shoot_timer > 0)
{
	alarm[0] = shoot_timer;
	shoot_timer = 0;
	is_detected_player = false;
}