event_inherited();
acceptWindow_sequence = undefined;

button_press = function()
{
	with (obj_character_show)
	{
		if (number == 2 && price > global.Moneys)
		{
			ShakeStart(10, 8);
			other.acceptWindow_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_acceptWindow);
		}
		else if (number == 2 && price < global.Moneys)
		{
			if (name == "virtualGuy")
				global.BoughtVirtualGuy = true;
			else if (name == "pinkMan")
				global.BoughtPinkMan = true;
			else if (name == "maskDude")
				global.BoughtMaskDude = true;
			is_bought = true;
			global.SaveSystemManager.Save();
			global.Moneys -= price;
		}
	}
}

delete_seq = function()
{
	if (acceptWindow_sequence == undefined) return;
	layer_sequence_destroy(acceptWindow_sequence);
	acceptWindow_sequence = undefined;
}