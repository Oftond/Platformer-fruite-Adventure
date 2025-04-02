if (!instance_exists(obj_player) || global.IsPause)
	exit;
instance_create_depth(x, y, depth - 1, obj_collect);
SetSoundPlay(sound_destroy);