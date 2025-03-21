if (not isMap(async_load))
{

}
else
{
    if ((async_load[? "type"] == "YaGames") and (async_load[? "request_id"] == req_id))
	{
        switch (async_load[? "event"]) {	
			case "leaderboardsInit":
				YaGames_Leaderboards_setScore("highScore", global.Score);
				set_up = true;
			break;
			
            case "offlineMode":
            break;
			
            case "notInitSDK":
            break;
			
            case "RuntimeError":
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];	
            break;
        }
   }
}