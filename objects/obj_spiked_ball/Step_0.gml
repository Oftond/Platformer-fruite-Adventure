if (mode)
{
	if (y <= yy + height && x < xx)
	spd_move -= 0.004;
	else if (y <= yy + height && x > xx)
		spd_move += 0.004;
	if (spd_move > spd_max)
		spd_move = spd_max;
	else if (spd_move < -spd_max)
		spd_move = -spd_max;
}

spd += spd_move;
x = xx + cos(spd) * r;
y = yy + sin(spd) *r;