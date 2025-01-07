event_inherited();
spd = 0;
chain_distance = 32;
height = 90;
spd_move = 0.08;
spd_max = 0.08;
mode = false;

chains = function()
{
	return r / chain_distance;
}

xx = 864;
yy = 288;
r = point_distance(x, y, xx, yy);