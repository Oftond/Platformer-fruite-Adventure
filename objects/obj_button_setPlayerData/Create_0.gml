var _flush = 1;
var _player_struct =
{
	max_hp : global.MaxHP,
	choose_character : global.ChooseCharacter,
	current_level : global.CurrentLevel,
	open_levels : global.OpenLevels,
	player_score : global.Score,
	score_in_level : global.ScoreInLevel,
	is_on_valume : global.IsOnValume,
	friuts_count_in_room : global.FruitsCountInRoom,
	moneys : global.Moneys,
	bought_maskDude : global.BoughtMaskDude,
	bought_pinkMan : global.BoughtPinkMan,
	bought_virtualGuy : global.BoughtVirtualGuy,
	is_helps_first : global.IsHelpsFirst,
	is_helps_second : global.IsHelpsSecond,
	is_helps_third : global.IsHelpsThird
};
var data = json_stringify(_player_struct);
req_id = YaGames_Player_SetData(data, _flush);