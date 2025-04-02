if (!instance_exists(obj_transition) && !instance_exists(obj_loseMenu))
{
	with (obj_player)
	{
		if (is_death) exit;
	}
	if (global.CurrentLevel > 0 && global.CurrentLevel < 6)
		SetMusicPlay(etherial_main);
	else if (global.CurrentLevel > 5 && global.CurrentLevel < 11)
		SetMusicPlay(hight_tempo_main);
	else if (global.CurrentLevel > 10 && global.CurrentLevel < 15)
		SetMusicPlay(heroic_main);
	else if (global.CurrentLevel == global.NumLevels)
		SetMusicPlay(driving_main);
}