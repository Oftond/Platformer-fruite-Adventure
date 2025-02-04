if (is_death || current_hp <= 0)
	exit;
instance_destroy(other)
global.RespownX = other.x_player_respawn;
global.RespownY = other.y_player_respawn;
SaveRoom();