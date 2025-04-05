event_inherited();
index = 5;
if(instance_exists(obj_pauseMenu)) index = 0;
image_speed = 0;

button_press = function()
{
	if (instance_exists(obj_transition))
		return;
	global.IsOnValume = !global.IsOnValume;
	global.ValumeMusic = global.IsOnValume ? global.MaxValumeMusic : 0;
	global.ValumeSound = global.IsOnValume ? global.MaxValumeSound : 0;
	audio_sound_gain(global.CurrentPlayingMusic, global.ValumeMusic, 0);
	audio_sound_gain(global.CurrentPlayingSound, global.ValumeSound, 0);
	
	global.SaveSystemManager.Save();
}

set_image = function()
{
	if (instance_exists(obj_transition)) return;
	if (global.IsOnValume)
	{
		image_index = 0;
		global.ValumeMusic = global.MaxValumeMusic;
		global.ValumeSound = global.MaxValumeSound;
	}
	else
	{
		image_index = 1;
		global.ValumeMusic = 0;
		global.ValumeSound = 0;
	}
}