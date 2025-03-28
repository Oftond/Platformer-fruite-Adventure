if (global.IsPause) exit;

if (y + move_spd_y * dir_y >= top_path_y && y + move_spd_y * dir_y <= bottom_path_y)
	move_y = move_spd_y * dir_y;
else
	move_y = 0;
if (x + move_spd_x * dir_x >= left_path_x && x + move_spd_x * dir_x <= right_path_x)
	move_x = move_spd_x * dir_x;
else
	move_x = 0;