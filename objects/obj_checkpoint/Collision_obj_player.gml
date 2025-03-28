if (other.is_death || other.current_hp <= 0 || global.IsPause)
	exit;
instance_destroy(self);
global.RespownX = x_player_respawn;
global.RespownY = y_player_respawn;
SaveRoom();