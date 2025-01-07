if (not isMap(async_load))
{
	
}
else
{
    if ((async_load[? "type"] == "YaGames") and (async_load[? "request_id"] == req_id)) {
		// Logging
		//
        switch (async_load[? "event"]) {	
			
            case "environment":
                // Environment data
				var data1 = async_load[? "data"];
				var data2 = data1[? "i18n"];
				lang = data2[? "lang"];
				done = true;
            break;
			
            case "notInitSDK":
				instance_destroy(self);
				instance_create_depth(x, y, -999, obj_button_getEnvironment);
                // SDK not initialized
            break;
            case "RuntimeError":
                var errCode = async_load[? "code"];
                var errName = async_load[? "name"];
                var errMessage = async_load[? "message"];	
                // SDK runtime error
            break;
        }
   }
}