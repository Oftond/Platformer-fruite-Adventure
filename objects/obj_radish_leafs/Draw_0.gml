if (global.IsPause) exit;

curvPosition += curvSpeed;
if (curvPosition >= 1 || alpha <= 0)
{
	instance_destroy(self);
}
var _curveStruct_right = animcurve_get(curve_right);
var _chennel_y_right = animcurve_get_channel(_curveStruct_right, "Y");
var _chennel_x_right = animcurve_get_channel(_curveStruct_right, "X");
var _value_y_right = animcurve_channel_evaluate(_chennel_y_right, curvPosition);
var _value_x_right = animcurve_channel_evaluate(_chennel_x_right, curvPosition);

var _curveStruct_left = animcurve_get(curve_left);
var _chennel_y_left = animcurve_get_channel(_curveStruct_left, "Y");
var _chennel_x_left = animcurve_get_channel(_curveStruct_left, "X");
var _value_y_left = animcurve_channel_evaluate(_chennel_y_left, curvPosition);
var _value_x_left = animcurve_channel_evaluate(_chennel_x_left, curvPosition);

yy_right += _value_y_right * 4;
xx_right += _value_x_right;

yy_left += _value_y_left * 4;
xx_left += _value_x_left;

draw_sprite_ext(sprite_leaf_right, 0, xx_right, yy_right, 1, 1, 0, c_white, alpha);
draw_sprite_ext(sprite_leaf_left, 0, xx_left, yy_left, 1, 1, 0, c_white, alpha)

if (alpha > 0)
	alpha -= 0.2;