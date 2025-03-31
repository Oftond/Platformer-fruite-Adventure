event_inherited();

is_touch = false;
wait_time = 10;
wait_timer = 0;
mask_index = sprite_index;

menu_sequence = undefined;

press = function()
{
	if (!is_touch && sprite_index != spr_end_pressed)
	{
		sprite_index = spr_end_pressed;
		is_touch = true;
		wait_timer = wait_time;
		obj_game_manager.is_end_level = true;
		if (global.OpenLevels <= global.CurrentLevel)
			global.OpenLevels++;
		
		global.RoomData = { };
		global.RespownX = -1;
		global.RespownY = -1;
		
		global.Score += score;
		
		if (room == rm_level_1 && !global.IsHelpsFirst)
		{
			global.IsHelpsFirst = true;
		}
		else if (room == rm_level_3 && !global.IsHelpsSecond)
		{
			global.IsHelpsSecond = true;
		}
		else if (room == rm_level_6 && !global.IsHelpsThird)
		{
			global.IsHelpsThird = true;
		}
		global.Moneys += obj_game_manager.moneys;
		if (global.ScoreInLevel[global.CurrentLevel - 1] < obj_game_manager.moneys)
			global.ScoreInLevel[global.CurrentLevel - 1] = obj_game_manager.moneys;
		
		global.CurrentLevel++;
		
		global.SaveSystemManager.Save();
		
		if (menu_sequence == undefined)
			menu_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_levelCompleted);
	}
}