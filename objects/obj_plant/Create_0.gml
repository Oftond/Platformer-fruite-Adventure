event_inherited();
sprite_hit = spr_plant_hit;
is_detected_player = false;
count_shoot = 0;
max_count_shoot = 3;
is_shoot = false;
dir = image_xscale;
shoot_range = 1000;
shoot_timer = 120;
max_shoot_timer = 120;
name = "plant";

change_dir = function()
{
	var _length = 200;
	if (collision_line(x, y, x - _length, y, obj_game_manager.collision_tilemap, false, false) || (place_empty(x - _length, y + 1, obj_game_manager.collision_tilemap) && place_empty(x - _length, y + 1, obj_game_manager.traps_layer_sand) && place_empty(x - _length, y + 1, obj_game_manager.traps_layer_ice)))
	{
		dir = -1;
		image_xscale = dir;
	}
}

change_dir();