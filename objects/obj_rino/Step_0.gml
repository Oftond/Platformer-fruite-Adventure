if (is_death)
{
	image_angle += 3;
	exit;
}

if (wait_time > 0 && state == STATES.IDLE)
	wait_time--;

is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap) || place_meeting(x, y + 1, obj_game_manager.traps_layer_sand) || place_meeting(x, y + 1, obj_game_manager.traps_layer_ice);
if (wait_time <= 0)
	move_x = move_spd * dir;

if (!is_graunded)
{
	move_y += grav;
}
if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	wait_time = wait_timer;
	state = STATES.HIT;
	hit_wall = true;
	move_spd = 0;
}

var _sub_pixel = 0.5;
if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
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

if (place_meeting(x, y + move_y, obj_game_manager.traps_layer_ice))
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_ice))
		y += _pixel_check;
	move_y = 0;
}

x += move_x;
y += move_y;

if (!instance_exists(obj_player))
	exit;

var _find_player = instance_nearest(x, y, obj_player);
var _check_wall = noone;
if (_find_player != noone)
	_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);

if (_check_wall == noone && state == STATES.IDLE && wait_time <= 0)
{
	if (y >= _find_player.y - 5 && y <= _find_player.y + 5)
	{
		state = STATES.ATTACK;
		dir = sign(x - _find_player.x) == 0 ? image_xscale : sign(_find_player.x - x);
	}
}

image_xscale = -dir;