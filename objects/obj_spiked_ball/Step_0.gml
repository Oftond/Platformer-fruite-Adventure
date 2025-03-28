if (global.IsPause) exit;

if (mode)
{
	if (y <= yy + max_height && x < xx)
	{
		spd_move -= 0.008;
	}
	else if (y <= yy + max_height && x > xx)
	{
		spd_move += 0.008;
	}
	if (spd_move > get_spd_max())
	{
		spd_move = get_spd_max();
	}
	else if (spd_move < -get_spd_max())
	{
		spd_move = -get_spd_max();
	}
}

spd += spd_move;
x = xx + cos(spd) * r;
y = yy + sin(spd) *r;