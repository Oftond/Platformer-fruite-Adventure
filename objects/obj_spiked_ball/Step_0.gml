if (mode)
{
	if (y <= yy + get_height() && x < xx)
	spd_move -= 0.004;
	else if (y <= yy + get_height() && x > xx)
		spd_move += 0.004;
	if (spd_move > get_spd_max())
		spd_move = get_spd_max();
	else if (spd_move < -get_spd_max())
		spd_move = -get_spd_max();
}

spd += spd_move;
x = xx + cos(spd) * r;
y = yy + sin(spd) *r;