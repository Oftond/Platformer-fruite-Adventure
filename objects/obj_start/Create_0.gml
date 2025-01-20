global.CameraWidth = camera_get_view_width(view_camera[0]);
global.CameraHeight = camera_get_view_height(view_camera[0]);

//camera_set_view_size(view_camera[0], 960, 540);
//camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]));

if (os_type == os_android || os_type == os_ios)
{
	global.is_touch = true;
}
else
{
	global.is_touch = false;
}

if (os_browser != browser_not_a_browser)
{
	bw = browser_width;
	bh = browser_height;
	var _aspect = global.CameraWidth / global.CameraHeight;
	surface_resize(application_surface, display_get_height() * _aspect, display_get_height());
	display_set_gui_size(global.CameraWidth, global.CameraHeight);
	window_set_size(bw, bh);
	window_center();
}