if (global.IsPause) exit;

if (place_meeting(x, y, obj_game_manager.collision_tilemap))
	instance_destroy();