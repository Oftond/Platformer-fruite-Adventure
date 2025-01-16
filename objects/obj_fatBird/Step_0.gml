event_inherited();

if (is_death)
	exit;
	
if (state == STATES.ATTACK && player_detected && y <= y_pos_to_fly)
{
	player_detected = false;
	state = STATES.IDLE;
}

if (state == STATES.FALL && player_detected)
{
	move_y += grav;
}

if (place_meeting(x, y + 1, obj_game_manager.collision_tilemap))
{
	move_y = 0;
	state = STATES.ATTACK;
}

if (state == STATES.ATTACK)
{
	move_y = -move_spd;
}

if (player_detected)
{
	y += move_y;
	exit;
}

var _find_player = instance_nearest(x, y, obj_player);
var _check_wall = noone;
if (_find_player != noone)
	_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);

if (_check_wall == noone && (bbox_right >= _find_player.x && bbox_left <= _find_player.x) && !player_detected)
{
	if (_find_player.y > y)
	{
		player_detected = true;
		state = STATES.FALL;
	}
}

if (player_detected)
	exit;

curvPosition += curvSpeed;
if (curvPosition >= 1)
{
	curvPosition = 0;
}
var _curveStruct = animcurve_get(curve);
var _chennel_y = animcurve_get_channel(_curveStruct, "Y");
var _value_y = animcurve_channel_evaluate(_chennel_y, curvPosition);
y = ystart + _value_y;