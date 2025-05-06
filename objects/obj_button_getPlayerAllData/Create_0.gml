is_set_up = false;
req_id = -1;

fileName = "SaveFile_1";
fileEnding = ".json";
file = $"{fileName}{fileEnding}";

if (file_exists(file))
{
	var _data = ReadFromFile(file);
	var _data_struct = { };
	
	try
	{
		_data_struct = json_parse(_data);
	}
	catch(e)
	{
		req_id = YaGames_Player_GetAllData();
		file_delete(file);
		exit;
	}
	
	global.MaxHP = _data_struct.max_hp;
	global.ChooseCharacter = _data_struct.choose_character;
	global.CurrentLevel = _data_struct.current_level;
	global.OpenLevels = _data_struct.open_levels;
	global.Score = _data_struct.player_score;
	global.ScoreInLevel = _data_struct.score_in_level;
	global.IsOnValume = _data_struct.is_on_valume;
	global.FruitsCountInRoom = _data_struct.friuts_count_in_room;
	global.BoughtMaskDude = _data_struct.bought_maskDude;
	global.BoughtPinkMan = _data_struct.bought_pinkMan;
	global.BoughtVirtualGuy = _data_struct.bought_virtualGuy;
	global.Moneys = _data_struct.moneys;
	global.IsHelpsFirst = _data_struct.is_helps_first;
	global.IsHelpsSecond = _data_struct.is_helps_second;
	global.IsHelpsThird = _data_struct.is_helps_third;
	
	if (!global.IsOnValume)
	{
		global.ValumeMusic = 0;
		global.ValumeSound = 0;
	}
	
	file_delete(file);
	
	instance_create_depth(0, 0, 0, obj_button_setPlayerData);
	is_set_up = true;
	
	instance_destroy(self);
}
else req_id = YaGames_Player_GetAllData();