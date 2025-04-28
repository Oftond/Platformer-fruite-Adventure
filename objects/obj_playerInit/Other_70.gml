if (not isMap(async_load))
{

}
else
{
    if ((async_load[? "type"] == "YaGames") && (async_load[? "request_id"] == req_id))
	{
        var _msg = json_encode(async_load);
        switch (async_load[? "event"])
		{
            case "playerInit":
				global.SaveSystemManager.Load();
            break;
			
			default:
				room_goto_next();
        }
   }
}