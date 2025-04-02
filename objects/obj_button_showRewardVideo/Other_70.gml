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
				unpause_music();
				if (instance_exists(obj_accept_get_moneys_menu))
				{
					global.Moneys += reward;
					global.SaveSystemManager.Save();
				}
				else if (instance_exists(obj_loseMenu))
				{
					global.RespownX = obj_game_manager.temp_player_respown_X;
					global.RespownY = obj_game_manager.temp_player_respown_y;
					SaveRoom();
				}
				instance_destroy();
            break;
			
            case "rewardClosed":
				unpause_music();
				instance_destroy();
            break;
			
            case "rewardError":
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];
				unpause_music();
				instance_destroy();
            break;
			
            case "notInitSDK":
				unpause_music();
				instance_destroy();
            break;
			
            case "RuntimeError":
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];
				instance_destroy();
				unpause_music();
            break;
			
			default:
				instance_destroy();
				unpause_music();
			break;
        }
   }
}