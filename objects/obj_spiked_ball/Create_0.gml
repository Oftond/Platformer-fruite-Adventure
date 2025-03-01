event_inherited();
spd = 0;
chain_distance = 32;
spd_max = 0.6;
spd_move = 0.08;
mode = false;
max_height = 120;

chains = function()
{
	return r / chain_distance;
}

get_spd_max = function()
{
	return spd_max / chains();
}

xx = 864;
yy = 288;
r = point_distance(x, y, xx, yy);