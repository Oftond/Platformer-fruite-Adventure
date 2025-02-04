image_speed = 0;

button_press = function()
{
	global.IsOnValume = !global.IsOnValume;
	
	if (global.IsOnValume)
		image_index = 0;
	else
		image_index = 1;
}