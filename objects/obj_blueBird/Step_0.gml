if (is_death)
{
	image_angle += 3;
	exit;
}

spd += move_spd;
x = xx + cos(spd) * r;
y = yy + sin(spd) *r;