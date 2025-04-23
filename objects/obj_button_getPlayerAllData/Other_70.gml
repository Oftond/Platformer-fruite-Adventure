if (is_set_up) exit;

if (not isMap(async_load))
{

}
else
{
    if ((async_load[? "type"]== "YaGames") && (async_load[? "request_id"] == req_id))
	{
        var _msg = json_encode(async_load);
		show_message($"Получить данные игрока: {async_load[? "event"]}");
        switch (async_load[? "event"])
		{
            case "playerGetData":
				var _data_struct = json_parse(async_load[? "data"]);
	
				global.MaxHP = _data_struct.max_hp;
				global.ChooseCharacter = _data_struct.choose_character;
				global.CurrentLevel = _data_struct.current_level;
				global.OpenLevels = _data_struct.open_levels;
				global.Score = _data_struct.player_score;
				global.ScoreInLevel = _data_struct.score_in_level;
				global.IsOnValume = _data_struct.is_on_valume;
				global.FruitsCountInRoom = _data_struct.friuts_count_in_room;
				global.BoughtMaskDude = _data_struct.bought_maskDude;
				global.BoughtPinkMan = _data_struct.bought_pinkMan;
				global.BoughtVirtualGuy = _data_struct.bought_virtualGuy;
				global.Moneys = _data_struct.moneys;
				global.IsHelpsFirst = _data_struct.is_helps_first;
				global.IsHelpsSecond = _data_struct.is_helps_second;
				global.IsHelpsThird = _data_struct.is_helps_third;
	
				if (!global.IsOnValume)
				{
					global.ValumeMusic = 0;
					global.ValumeSound = 0;
				}
				
				is_set_up = true;
				
				show_message("Все данные успешно были прочитаны с сервера Яндекс Игр!!!")
            break;
			
            //case YaGames_CallPlayerGetDataError:
            //    var errCode = async_load[? "code"];
            //    var errName = async_load[? "name"];
            //    var errMessage = async_load[? "message"];	
            //    // Data request error
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