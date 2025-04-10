if (not isMap(async_load))
{

}
else
{
    if ((async_load[? "type"] == "YaGames") and (async_load[? "request_id"] == req_id))
	{
        var _msg = json_encode(async_load);
        switch (async_load[? "event"]) {	
            case "adClosed":
				unpause_music();
                var _data = async_load[? "data"];
				var _isShown = _data[? "wasShown"];
				instance_destroy(self);
            break;
            case "adOpened":
				pause_music();
            break;
            case "offlineMode":
				unpause_music();
				instance_destroy(self);
            break;
            case "adError":
				unpause_music();
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];
				instance_destroy(self);
            break;
			
            case "notInitSDK":
				unpause_music();
				instance_destroy(self);
            break;
            case "RuntimeError":
				unpause_music();
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];
				instance_destroy(self);
            break;
        }
   }
}