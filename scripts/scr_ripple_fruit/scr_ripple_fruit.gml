function ripple_fruit(_sprite, _offset_x, _is_ripple, _obj)
{
	static ripple_effect = 1.5;
	if (_is_ripple)
	{
		ripple_effect = 1.5;
		_obj.is_ripple_fruit = false;
	}
	if (ripple_effect > 1)
		ripple_effect -= 0.1;
	if (!obj_game_manager.endAlpha)
		return;
	draw_sprite_ext(_sprite, 0, (camera_get_view_width(view_camera[0]) / 2) + _offset_x, 100, ripple_effect, ripple_effect, 0, c_white, 1);
}