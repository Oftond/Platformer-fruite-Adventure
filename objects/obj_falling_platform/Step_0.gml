if (grav == max_grav || grav == -max_grav)
{
	move_y += grav;
}

if (y > room_height + 50 && time_to_back == 0)
{
	grav = 0;
	move_y = 0;
	alarm[2] = max_time_to_back;
	time_to_back = max_time_to_back;
}

if (grav == -max_grav && y <= start_y_pos)
{
	y = start_y_pos;
	recover_all();
}