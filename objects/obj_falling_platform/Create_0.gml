event_inherited();

dir_y = choose(1, -1);
start_y_pos = y;
wait_time = 14;
max_time = 6;
fall_time = 0;
max_fall_time = 30;
grav = 0;
max_grav = 0.5
max_time_to_back = 600;
time_to_back = 0;

set_fall_time = function()
{
	if (fall_time < max_fall_time)
	{
		fall_time = max_fall_time;
		alarm[1] = fall_time;
	}
}

fall_platform = function()
{
	wait_time = 0;
	time = 0;
	move_y = 0;
	dir_y = 1;
	grav = max_grav;
	image_index = 0;
	sprite_index = spr_falling_platform_off;
}

recover_all = function()
{
	wait_time = 14;
	time = 0;
	move_y = 0;
	dir_y = choose(-1, 1);
	stop_platform = false;
	grav = 0;
	time_to_back = 0;
	fall_time = 0;
}