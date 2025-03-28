if (global.IsPause) exit;

event_inherited();

if (state == STATES.HIT || is_death || state == STATES.ATTACK || attack_timer > 0)
{
	if (attack_timer > 0 && state != STATES.ATTACK)
		attack_timer--;
	exit;
}

var _find_player = instance_nearest(x, y, obj_player);
var _distance_to_player = detection_distance + 1;
var _check_wall = noone;
if (_find_player != noone)
{
	_distance_to_player = point_distance(x, y, _find_player.x, _find_player.y);
	_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);
}

if (_distance_to_player <= detection_distance && _find_player != noone && _check_wall == noone && !detected_player)
{
	if (y >= _find_player.y - 20 && y <= _find_player.y + 20)
	{
		detected_player = true;
		state = STATES.ATTACK;
		var _angle = sign(round(obj_player.x - x)) != 0 ? -sign(round(obj_player.x - x)) : image_xscale;
		image_xscale = _angle;
		if (wait_timer > 0)
		{
			dir *= -1;
			wait_timer = 0;
		}
	}
}

if (detected_player)
	exit;

if (state == STATES.WALK)
	move_x = move_spd * dir;

if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap) || place_empty(x + 100 * dir, y + 30, obj_game_manager.collision_tilemap))
{
	if (wait_timer <= 0)
	{
		wait_timer = wait_time;
		state = STATES.IDLE;
		move_x = 0;
	}
}

if (wait_timer <= 0 && !detected_player)
	state = STATES.WALK;

if (wait_timer <= 0 && !detected_player)
{
	if (image_xscale != -dir)
		image_xscale = -dir
	x += move_x;
}
else
{
	wait_timer--;
	if (wait_timer <= 0)
	{
		dir *= -1;
		image_xscale = -dir;
	}
}