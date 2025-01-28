if (!instance_exists(obj_player))
	exit;

if (number > obj_player.current_hp)
	instance_destroy(self);