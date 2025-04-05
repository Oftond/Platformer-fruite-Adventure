cellSize += 2;

fx_set_parameter(transition_filter, "g_CellSize", cellSize);

alarm[0] = 1;

if ((current_room == rm_menu && room_to_go == rm_levels_map) || (current_room == rm_levels_map && room_to_go == rm_menu) || !global.IsOnValume || (global.CurrentLevel != 6 && global.CurrentLevel != 11 && global.CurrentLevel && 15 && current_room != rm_menu && current_room != rm_levels_map && room_to_go != rm_menu && room_to_go != rm_levels_map))
	exit;

if (global.ValumeMusic > 0)
	global.ValumeMusic -= 0.01;

audio_sound_gain(global.CurrentPlayingMusic, global.ValumeMusic, 0);