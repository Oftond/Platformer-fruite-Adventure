if (!instance_exists(follow) || global.shake)
	exit;

var _target_x = follow.x - (camera_width / 2);
var _target_y = follow.y - (camera_height / 2);

_target_x = clamp(_target_x, 0, room_width - camera_width);
_target_y = clamp(_target_y, 0, room_height - camera_height);

finale_cam_x += (_target_x - finale_cam_x) * cam_spd_x;
finale_cam_y += (_target_y - finale_cam_y) * cam_spd_y;

camera_set_view_pos(view_camera[0], finale_cam_x, finale_cam_y);

//var _super_near = layer_get_id("Backgrounds_5");
//var _near = layer_get_id("Backgrounds_4");
//var _still_near = layer_get_id("Backgrounds_3");
//var _distant = layer_get_id("Backgrounds_2");
//var _for_away = layer_get_id("Backgrounds_1");

//layer_x(_super_near, lerp(0, camera_get_view_x(view_camera[0]), 0.5));
//layer_x(_near, lerp(0, camera_get_view_x(view_camera[0]), 0.5));
//layer_x(_still_near, lerp(0, camera_get_view_x(view_camera[0]), 1));
//layer_x(_distant, lerp(0, camera_get_view_x(view_camera[0]), 1));
//layer_x(_for_away, lerp(0, camera_get_view_x(view_camera[0]), 0.970));