req_id = YaGames_showRewardedVideo();
pause_music();

with(obj_game_manager)
{
	global.RespownX = start_player_x;
	global.RespownY = start_player_y;
	global.RoomData = { };
}