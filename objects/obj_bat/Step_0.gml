if (is_death)
{
	image_angle += 3;
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

if (_distance_to_player <= detection_distance && _find_player != noone && _check_wall == noone)
{
	state = STATES.WALK;
	dir = sign(round(_find_player.x - x)) != 0 ? sign(round(_find_player.x - x)) : image_xscale;
	move_x = move_spd * dir;
}
else
{
	
}

var _sub_pixel = 0.5;
if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
}

if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
}

image_xscale = -dir;

x += move_x;