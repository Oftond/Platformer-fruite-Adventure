if (instance_number(obj_main_manager) > 1) instance_destroy(self);

randomize();
if (os_browser != browser_not_a_browser)
{
	bw = browser_width;
	bh = browser_height;
	var _aspect = global.CameraWidth / global.CameraHeight;
	display_set_gui_size(global.CameraWidth, global.CameraHeight);
	surface_resize(application_surface, display_get_height() * _aspect, display_get_height());
	window_set_size(bw, bh);
	window_center();
}

instance_create_depth(0, 0, 0, obj_button_getEnvironment);