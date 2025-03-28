if (global.IsPause) exit;

event_inherited();

if (is_death)
	exit;

if (state == STATES.IDLE && player_detected && y <= y_pos_to_fly)
	player_detected = false;

if (state == STATES.FALL && player_detected)
	move_y += grav;

var _sub_pixel = 0.5;
if (place_meeting(x, y + (move_y + 10 * sign(move_y)), obj_game_manager.collision_tilemap) && state == STATES.FALL && state != STATES.HIT)
{
	y = round(y);
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
	if (state != STATES.HIT)
		state = STATES.ATTACK;
}
else if (place_meeting(x, y + (move_y + 10 * sign(move_y)), obj_game_manager.traps_layer_sand) && state == STATES.FALL && state != STATES.HIT)
{
	y = round(y);
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_sand))
		y += _pixel_check;
	move_y = 0;
	if (state != STATES.HIT)
		state = STATES.ATTACK;
}
else if (place_meeting(x, y + (move_y + 10 * sign(move_y)), obj_game_manager.traps_layer_ice) && state == STATES.FALL && state != STATES.HIT)
{
	y = round(y);
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_ice))
		y += _pixel_check;
	move_y = 0;
	if (state != STATES.HIT)
		state = STATES.ATTACK;
}

if (state == STATES.IDLE && player_detected)
{
	move_y = -move_spd * 2;
}

var _find_player = instance_nearest(x, y, obj_player);
var _check_wall = noone;
if (_find_player != noone)
	_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);

if (_check_wall == noone && _find_player != noone && (bbox_right >= _find_player.x && bbox_left <= _find_player.x))
{
	if (_find_player.y > y && state != STATES.HIT)
	{
		player_detected = true;
		state = STATES.FALL;
	}
}

if (player_detected)
{
	y += move_y;
	exit;
}

curvPosition += curvSpeed;
if (curvPosition >= 1)
{
	curvPosition = 0;
}

var _curveStruct = animcurve_get(curve);
var _chennel_y = animcurve_get_channel(_curveStruct, "Y");
var _value_y = animcurve_channel_evaluate(_chennel_y, curvPosition);
y = ystart + _value_y;