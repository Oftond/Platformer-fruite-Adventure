y += move_y;
x += move_x;
time++;
if (time >= max_time && !stop_platform)
{
	dir_y *= -1;
	alarm[0] = wait_time;
	move_x = 0;
	move_y = 0;
	stop_platform = true;
}