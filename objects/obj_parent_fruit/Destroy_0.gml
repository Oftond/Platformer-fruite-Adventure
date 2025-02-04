if (!instance_exists(obj_player))
	exit;
instance_create_depth(x, y, depth - 1, obj_collect);