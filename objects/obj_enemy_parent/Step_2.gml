if (current_hp <= 0 && !is_death)
{
	current_hp = 0;
	is_death = true;
	gravity = 1.5;
	vspeed = -20;
	image_xscale = -1;
	depth = -9999;
}