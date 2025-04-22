if (global.CurrentLevel >= global.NumLevels && instance_exists(obj_game_manager))
{
	global.CurrentLevel = global.NumLevels;
	room_goto(rm_menu)
	exit;
}
room_goto(asset_get_index($"rm_level_{global.CurrentLevel}"));