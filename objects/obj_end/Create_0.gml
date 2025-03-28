event_inherited();

is_touch = false;
wait_time = 10;
wait_timer = 0;
mask_index = sprite_index;

press = function()
{
	if (!is_touch && sprite_index != spr_end_pressed)
	{
		sprite_index = spr_end_pressed;
		is_touch = true;
		wait_timer = wait_time;
		obj_game_manager.is_end_level = true;
		instance_create_layer(0, 0, "GUI", obj_transition);
		global.RoomData = { };
		global.RespownX = -1;
		global.RespownY = -1;
		var _allScore = 0;
		if (score > global.ScoreInLevel[global.CurrentLevel - 1])
		{
			global.Score += score - global.ScoreInLevel[global.CurrentLevel - 1];
			global.ScoreInLevel[global.CurrentLevel - 1] = score;
		}
		if (global.OpenLevels <= global.CurrentLevel)
			global.OpenLevels++;
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
		global.Moneys += score;
		global.SaveSystemManager.Save();
	}
}