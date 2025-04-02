req_id = YaGames_showRewardedVideo();
reward = 30;
pause_music();
global.RespownX = obj_game_manager.temp_player_respown_X;
global.RespownY = obj_game_manager.temp_player_respown_y;
SaveRoom();
instance_destroy();
unpause_music();