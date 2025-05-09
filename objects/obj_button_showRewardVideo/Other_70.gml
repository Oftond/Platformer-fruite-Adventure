if (not isMap(async_load))
{
	
}
else
{
    if ((async_load[? "type"] == "YaGames") and (async_load[? "request_id"] == req_id)) {
        var _msg = json_encode(async_load);
        switch (async_load[? "event"]) {
			
            case "rewardOpened":
				pause_music();
            break;
			
            case "rewardReceived":
				if (instance_exists(obj_menu_manager) && !instance_exists(obj_game_manager))
				{
					global.Moneys += obj_menu_manager.moneys_bonus;
					global.SaveSystemManager.Save();
				}
				else if (instance_exists(obj_game_manager) && !instance_exists(obj_menu_manager))
				{
					global.IsWatchVideo = true;
					global.RespownX = obj_game_manager.temp_player_respown_X;
					global.RespownY = obj_game_manager.temp_player_respown_y;
					SaveRoom();
				}
            break;
			
            case "rewardClosed":
				unpause_music();
				instance_destroy(self);
            break;
			
			case "rewardError":
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];
				unpause_music();
				instance_destroy(self);
            break;
			
            case "notInitSDK":
				unpause_music();
				instance_destroy(self);
            break;
			
            case "RuntimeError":
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];
				unpause_music();
				instance_destroy(self);
            break;
        }
   }
}