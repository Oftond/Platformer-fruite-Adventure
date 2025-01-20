if (is_death)
	exit;
var _x_pos = image_xscale == 1 ? bbox_right : bbox_left
instance_create_layer(_x_pos, bbox_bottom - 8, "Enemys", obj_slime_part);
alarm[0] = wait_time;