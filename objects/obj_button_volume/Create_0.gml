event_inherited();
image_speed = 0;

button_press = function()
{
	global.IsOnValume = !global.IsOnValume;
	
	if (global.IsOnValume)
	{
		image_index = 0;
		global.ValumeMusic = 0.5;
		global.ValumeSound = 0.5;
	}
	else
	{
		image_index = 1;
		global.ValumeMusic = 0;
		global.ValumeSound = 0;
	}
}