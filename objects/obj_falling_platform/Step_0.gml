if (global.IsPause) exit;

if (fall_time > 0)
{
	fall_time--;
	if (fall_time == 0)
		fall_platform();
}

if (time_to_back > 0)
{
	time_to_back--;
	if (time_to_back == 0)
	{
		grav = -max_grav;
		image_index = 0;
		sprite_index = spr_falling_platform_on;
	}
}

if (grav == max_grav || grav == -max_grav)
{
	move_y += grav;
}

if (y > room_height + 50 && time_to_back == 0 && is_comeback)
{
	grav = 0;
	move_y = 0;
	time_to_back = max_time_to_back;
	is_comeback = false;
}

if (grav == -max_grav && y <= start_y_pos)
{
	is_comeback = true;
	y = start_y_pos;
	recover_all();
}