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
				set_up = true;
				global.SaveSystemManager.Load();
				instance_destroy(self);
            break;
			
			default:
				if (!set_up)
					room_goto_next();
        }
   }
}