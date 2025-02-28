event_inherited();
spd = 0;
chain_distance = 32;
spd_max = 0.8;
spd_move = 0.08;
mode = false;
max_height = 30;

chains = function()
{
	return r / chain_distance;
}

get_spd_max = function()
{
	return spd_max / (get_height() / max_height);
}

get_height = function()
{
	return max_height * (r / chain_distance);
}

xx = 864;
yy = 288;
r = point_distance(x, y, xx, yy);