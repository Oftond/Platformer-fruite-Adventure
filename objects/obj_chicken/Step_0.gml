if (is_death)
{
	image_angle += 3;
	exit;
}

var _find_player = instance_nearest(x, y, obj_player);
var _distance_to_player = distance_detection + 1;
var _check_wall = noone;
if (_find_player != noone)
{
	_distance_to_player = point_distance(x, y, _find_player.x, _find_player.y);
	_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);
}

state = STATES.IDLE;

if (_check_wall == noone && _distance_to_player <= distance_detection)
{
	state = STATES.WALK;
	dir = sign(x - _find_player.x) == 0 ? image_xscale : sign(_find_player.x - x);
}

move_x = move_spd * dir;

var _sub_pixel = 0.5;
if (place_meeting(x + move_x, y - 10, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
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