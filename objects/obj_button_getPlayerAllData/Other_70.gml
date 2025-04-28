if (is_set_up) exit;

if (not isMap(async_load))
{

}
else
{
    if ((async_load[? "type"]== "YaGames") && (async_load[? "request_id"] == req_id))
	{
        var _msg = json_encode(async_load);
        switch (async_load[? "event"])
		{
            case "playerGetData":
				var _data_struct = json_parse(async_load[? "data"]);
				
				if (ds_map_size(_data_struct) == 0 && !is_set_up)
				{
					is_set_up = true;
					room_goto_next();
				}
				else if (ds_map_size(_data_struct) > 0 && !is_set_up)
				{
					global.MaxHP = _data_struct[? "max_hp"];
					global.ChooseCharacter = _data_struct[? "choose_character"];
					global.CurrentLevel = _data_struct[? "current_level"];
					global.OpenLevels = _data_struct[? "open_levels"];
					global.Score = _data_struct[? "player_score"];
					global.IsOnValume = _data_struct[? "is_on_valume"];
					global.BoughtMaskDude = _data_struct[? "bought_maskDude"];
					global.BoughtPinkMan = _data_struct[? "bought_pinkMan"];
					global.BoughtVirtualGuy = _data_struct[? "bought_virtualGuy"];
					global.Moneys = _data_struct[? "moneys"];
					global.IsHelpsFirst = _data_struct[? "is_helps_first"];
					global.IsHelpsSecond = _data_struct[? "is_helps_second"];
					global.IsHelpsThird = _data_struct[? "is_helps_third"];
				
					global.ScoreInLevel = GetArrayFromString(_data_struct[? "score_in_level"]);
					global.FruitsCountInRoom = GetArrayFromString(_data_struct[? "friuts_count_in_room"]);
				
					if (!global.IsOnValume)
					{
						global.ValumeMusic = 0;
						global.ValumeSound = 0;
					}
				
					is_set_up = true;
					room_goto_next();
				}
            break;
			
			default:
				room_goto_next();
        }
   }
}