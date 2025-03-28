if (global.IsPause) exit;

if (!stop_platform)
{
	time = 0;
	move_y = move_spd_y * dir_y;
	move_x = move_spd_x * dir_x;
}