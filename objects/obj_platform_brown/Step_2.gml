if (start_move && stop_platform)
{
	dir_y *= -1;
	dir_x *= -1;
	stop_platform = false;
}

y += move_y;
x += move_x;

if (!start_move && !stop_platform)
{
	dir_y *= -1;
	dir_x *= -1;
	stop_platform = true;
}
if (move_y != 0 || move_x != 0)
	sprite_index = spr_platform_brown_on;
else
	sprite_index = spr_platform_brown_off;