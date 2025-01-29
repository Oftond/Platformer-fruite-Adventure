if (instance_exists(obj_player))
	depth = obj_player.depth + 1;
else
	depth = obj_parent_move_platform.depth - 20;