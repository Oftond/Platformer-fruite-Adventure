function SetSettingsCamera()
{
	var _target_x = global.RespownX - (global.CameraWidth / 2);
	var _target_y = global.RespownY - (global.CameraHeight / 2);

	_target_x = clamp(_target_x, 0, room_width - global.CameraWidth);
	_target_y = clamp(_target_y, 0, room_height - global.CameraHeight);

	finale_cam_x = _target_x;
	finale_cam_y = _target_y;

	camera_set_view_pos(view_camera[0], finale_cam_x, finale_cam_y);
}