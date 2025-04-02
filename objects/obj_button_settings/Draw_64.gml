if ((instance_exists(obj_transition) || (instance_exists(obj_shake)) && (room == rm_menu || room == rm_levels_map)) || instance_exists(obj_pauseMenu) || instance_exists(obj_finishLevel) || instance_exists(obj_loseMenu))
	exit;
draw_self();