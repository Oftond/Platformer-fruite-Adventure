if (other.is_death || other.current_hp <= 0 || global.IsPause)
	exit;
instance_destroy(self);
obj_game_manager.temp_player_respown_X = x_player_respawn;
obj_game_manager.temp_player_respown_y = y_player_respawn;
obj_game_manager.is_checkpoint = true;