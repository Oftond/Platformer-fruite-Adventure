global.shake_intensity = 0;
global.shake_timer = 0;
global.shake = false;
function ShakeStart(_intensity, _time)
{
	if (!instance_exists(obj_shake))
		return;
	else
	{
		obj_shake.view_x = camera_get_view_x(view_camera[0]);
		obj_shake.view_y = camera_get_view_y(view_camera[0]);
	}
	global.shake_intensity = _intensity;
	global.shake_timer = _time;
	global.shake = true;
}