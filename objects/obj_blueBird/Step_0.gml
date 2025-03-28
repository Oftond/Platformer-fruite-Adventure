if (global.IsPause) exit;

event_inherited();

if (is_death)
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