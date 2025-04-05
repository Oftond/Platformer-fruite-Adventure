SetMusicPlay(MP3_Welcome_Home_Main);

if (!is_keyboard_control && (input_pressed(INPUT.DOWN) || input_pressed(INPUT.LEFT) || input_pressed(INPUT.UP) || input_pressed(INPUT.RIGHT) || input_pressed(INPUT.ACCEPT)))
{
	is_keyboard_control = true;
	if (!global.IsMovedCursor) exit;
}

if (input_pressed(INPUT.LEFT) && instance_exists(obj_button_buyCharacter))
{
	if (instance_exists(obj_accept_get_moneys_menu))
		selected_index = max(selected_index - 1, 7);
	else
		selected_index = max(selected_index - 1, 0);
}
else if (input_pressed(INPUT.LEFT))
{
	if (instance_exists(obj_accept_get_moneys_menu))
		selected_index = max(selected_index - 1, 7);
	else
		selected_index = max(selected_index - 1, 0);
}

if (input_pressed(INPUT.RIGHT))
{
	if ((instance_exists(obj_button_buyCharacter) && instance_exists(obj_accept_get_moneys_menu)) || (!instance_exists(obj_button_buyCharacter) && !instance_exists(obj_accept_get_moneys_menu)) || (instance_exists(obj_button_buyCharacter) && !instance_exists(obj_accept_get_moneys_menu)))
		selected_index = min(selected_index + 1, instance_number(obj_button_parent) - 1);
	else if (!instance_exists(obj_button_buyCharacter) && instance_exists(obj_accept_get_moneys_menu))
		selected_index = min(selected_index + 1, instance_number(obj_button_parent));
}

if (!instance_exists(obj_button_buyCharacter))
{
	if (input_pressed(INPUT.UP))
	{
		if (selected_index == 0 || selected_index == 1 ||
		selected_index == 2 || selected_index == 3 || selected_index == 4)
		selected_index = min(selected_index + 3, instance_number(obj_button_parent) - 1);
	}

	if (input_pressed(INPUT.DOWN))
	{
		if (selected_index == 2 || selected_index == 3 ||selected_index == 4) selected_index = max(selected_index - 3, 0);
		else if (selected_index == 5) selected_index = max(selected_index - 1, 0);
	}
}
else if (!instance_exists(obj_accept_get_moneys_menu))
{
	if (input_pressed(INPUT.UP))
	{
		if (selected_index == 0 || selected_index == 1 || selected_index == 2 ||
		selected_index == 3 || selected_index == 4 || selected_index == 5) 
		selected_index = min(selected_index + 3, instance_number(obj_button_parent) - 1);
	}

	if (input_pressed(INPUT.DOWN))
	{
		if (selected_index == 3 || selected_index == 4 || selected_index == 5) selected_index = max(selected_index - 3, 0);
		else if (selected_index == 6) selected_index = max(selected_index - 1, 0);
	}
}









//////////




exit;
// В событии Step:

// Получаем текущую камеру (предполагаем, что она уже создана)
var _camera = view_get_camera(0);

// Получаем текущие параметры камеры
var _cam_x = camera_get_view_x(_camera);
var _cam_y = camera_get_view_y(_camera);
var _cam_w = camera_get_view_width(_camera);
var _cam_h = camera_get_view_height(_camera);

// Центральная точка камеры (которая должна оставаться неизменной)
var _center_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
var _center_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

// Обработка ввода для изменения зума (пример для колесика мыши)
var _zoom_change = mouse_wheel_up() - mouse_wheel_down();
if (_zoom_change != 0)
{
    // Изменяем целевой зум с ограничениями
    target_zoom = clamp(target_zoom + _zoom_change * 0.1, min_zoom, max_zoom);
}

// Плавное приближение к целевому зуму
var _current_zoom = camera_get_view_height(_camera) / display_get_gui_height();
var _new_zoom = lerp(_current_zoom, target_zoom, zoom_speed);

// Если зум изменился
if (abs(_new_zoom - _current_zoom) > 0.001)
{
    // Вычисляем новые размеры viewport'а
    var _new_w = 1280;
    var _new_h = 720;
    
    // Вычисляем новые координаты камеры, чтобы центр остался прежним
    var _new_x = _center_x - _new_w / 2;
    var _new_y = _center_y - _new_h / 2;
    
    // Применяем изменения к камере
    camera_set_view_pos(view_camera[0], _new_x, _new_y);
    camera_set_view_size(view_camera[0], _new_w, _new_h);
	
	//gui_scale = _new_zoom;
    
    //// Устанавливаем новый размер GUI слоя
    //display_set_gui_size(base_gui_width * gui_scale, base_gui_height * gui_scale);
    
    //// Обновляем все слои GUI
    //var _num_layers = layer_get_all_elements("GUI");
    //for (var i = 0; i < _num_layers; i++)
    //{
    //    var _layer_id = layer_get_element(i);
    //    if (layer_get_type(_layer_id) == layertype_gui)
    //    {
    //        // Масштабируем GUI слои
    //        layer_x(_layer_id, 0);
    //        layer_y(_layer_id, 0);
    //        layer_htexel(_layer_id, 1 / gui_scale);
    //        layer_vtexel(_layer_id, 1 / gui_scale);
    //    }
    //}
}