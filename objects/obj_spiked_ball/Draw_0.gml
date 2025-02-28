for	(var i = 0; i < chains(); i++)
{
	draw_sprite_ext(spr_spiked_ball_chain, 0, xx + cos(spd) * (i * chain_distance), yy + sin(spd) * (i * chain_distance), 1, 1, 0, c_white, 1);
}
draw_self();