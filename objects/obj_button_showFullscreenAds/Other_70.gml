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
				audio_set_master_gain(1, 1);
                var _data = async_load[? "data"];
				var _isShown = _data[? "wasShown"];
            break;
            case "adOpened":
				audio_set_master_gain(1, 0);
            break;
            case "offlineMode":
				audio_set_master_gain(1, 1);
            break;
            case "adError":
				audio_set_master_gain(1, 1);
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];	
            break;
			
            case "notInitSDK":
				audio_set_master_gain(1, 1);
            break;
            case "RuntimeError":
				audio_set_master_gain(1, 1);
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];	
            break;
        }
   }
}