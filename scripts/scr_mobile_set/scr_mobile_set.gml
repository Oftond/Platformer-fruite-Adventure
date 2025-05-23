function mobile_sittings_menu_and_levelsMenu_set()
{
	var _center_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
	var _center_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

	var _new_w = 1280;
	var _new_h = 720;

	var _new_x = _center_x - _new_w / 2;
	var _new_y = _center_y - _new_h / 2;

	camera_set_view_pos(view_camera[0], _new_x, _new_y);
	camera_set_view_size(view_camera[0], _new_w, _new_h);
	
	var _aspect = camera_get_view_width(view_camera[0]) / camera_get_view_height(view_camera[0]);
	display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	surface_resize(application_surface, display_get_height() * _aspect, display_get_height());
}

function mobile_settings_levels_game()
{
	var _new_w = 1280;
	var _new_h = 720;
	
	camera_set_view_size(view_camera[0], _new_w, _new_h);
	
	var _aspect = camera_get_view_width(view_camera[0]) / camera_get_view_height(view_camera[0]);
	display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	surface_resize(application_surface, display_get_height() * _aspect, display_get_height());
}