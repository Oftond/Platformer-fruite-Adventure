if (not isMap(async_load))
{

}
else
{
    if ((async_load[? "type"] == "YaGames") && (async_load[? "request_id"] == req_id))
	{
        var _msg = json_encode(async_load);
		show_message($"Установить данные игрока: {async_load[? "event"]}");
        switch (async_load[? "event"])
		{
            case "playerSetData":
				show_message("Все данные игрока были успешно загружены на сервер Яндекс Игр!")
            break;
			
            //case YaGames_CallPlayerSetDataError:
            //    var errCode = async_load[? "code"];
            //    var errName = async_load[? "name"];
            //    var errMessage = async_load[? "message"];	
            //    // Data set request error
            //break;
			
            //case YaGames_CallNotPlayerInitSDK:
            //    // Player in SDK not initialized
            //break;
			
            //case YaGames_CallNotInitSDK:
            //    // SDK not initialized
            //break;
			
            //case YaGames_CallRuntimeError:
            //    var errCode = async_load[? "code"];
            //    var errName = async_load[? "name"];
            //    var errMessage = async_load[? "message"];	
            //    // SDK runtime error
            //break;
        }
   }
}