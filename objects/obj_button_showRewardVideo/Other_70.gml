if (not isMap(async_load))
{
	
}
else
{
    if ((async_load[? "type"] == "YaGames") and (async_load[? "request_id"] == req_id)) {
        var _msg = json_encode(async_load);
        switch (async_load[? "event"]) {	
			
            case "rewardOpened":
            break;
            case "rewardReceived":
				lives++;
				instance_destroy();
            break;
            case "rewardClosed":
				instance_destroy();
            break;
            case "rewardError":
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];
				instance_destroy();
            break;
			
            case "notInitSDK":
				instance_destroy();
            break;
            case "RuntimeError":
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];
				instance_destroy();
            break;
        }
   }
}