if (other.is_death || other.current_hp <= 0)
	exit;
instance_destroy(self);
global.RespownX = x_player_respawn;
global.RespownY = y_player_respawn;
SaveRoom();