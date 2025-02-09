global.shake_intensity = 0;
global.shake_timer = 0;
global.shake = false;
function ShakeStart(_intensity, _time)
{
	global.shake_intensity = _intensity;
	global.shake_timer = _time;
	global.shake = true;
}