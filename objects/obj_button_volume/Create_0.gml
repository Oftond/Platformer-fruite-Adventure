event_inherited();
index = 4;
image_speed = 0;

button_press = function()
{
	if (instance_exists(obj_transition))
		return;
	global.IsOnValume = !global.IsOnValume;
	
	global.SaveSystemManager.Save();
}

set_image = function()
{
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