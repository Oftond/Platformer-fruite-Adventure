if (global.shake)
{
	if (global.shake_timer > 0)
	{
		global.shake_timer--;
		var x_pos = random_range(-global.shake_intensity, global.shake_intensity);
		var y_pos = random_range(-global.shake_intensity, global.shake_intensity);
		camera_set_view_pos(view_camera[0], view_x + x_pos, view_y + y_pos);
	}
	else
	{
		camera_set_view_pos(view_camera[0], view_x, view_y);
		global.shake = false;
	}	
}