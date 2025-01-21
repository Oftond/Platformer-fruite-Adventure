if (instance_exists(obj_camera))
	instance_destroy(obj_camera);

if (!instance_exists(obj_player_disappear))
	instance_create_layer(x, y, "Player", obj_player_disappear);