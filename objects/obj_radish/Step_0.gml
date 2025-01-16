event_inherited();

if (is_death)
	exit;
	
is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap);
	
curvPosition += curvSpeed;
if (curvPosition >= 1)
{
	curvPosition = 0;
}
var _curveStruct = animcurve_get(curve);
var _chennel_y = animcurve_get_channel(_curveStruct, "Y");
var _value_y = animcurve_channel_evaluate(_chennel_y, curvPosition);
y = ystart + _value_y;