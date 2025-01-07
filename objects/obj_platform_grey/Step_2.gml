if (y + move_y >= top_path_y && y + move_y <= bottom_path_y)
	y += move_y;
if (x + move_x >= left_path_x && x + move_x <= right_path_x)
	x += move_x;
if (((x <= left_path_x || x >= right_path_x) || (y <= top_path_y || y >= bottom_path_y)) && !stop_platform && time < max_time)
{
	dir_y *= -1;
	dir_x *= -1;
	alarm[0] = wait_time;
	move_x = 0;
	move_y = 0;
	stop_platform = true;
	time = max_time;
}
if (move_y != 0 || move_x != 0)
	sprite_index = spr_platform_grey_on;
else
	sprite_index = spr_platform_grey_off;