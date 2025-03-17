event_inherited();

if (is_death || state == STATES.HIT)
	exit;
	
if (wait_timer > 0)
{
	wait_timer--;
	if (wait_timer <= 0)
		dir *= -1;
}

is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap) || place_meeting(x, y + 1, obj_game_manager.traps_layer_sand) || place_meeting(x, y + 1, obj_game_manager.traps_layer_ice);

if (!is_graunded && current_hp < max_hp)
	move_y += grav;
else if (is_graunded)
	move_y = 0;

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

y += move_y;

if (current_hp < max_hp)
{
	if (is_graunded)
		walk();
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