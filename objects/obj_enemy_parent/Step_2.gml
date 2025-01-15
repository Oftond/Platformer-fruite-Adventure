if (current_hp <= 0 && !is_death)
{
	current_hp = 0;
	is_death = true;
	gravity = 1.5;
	vspeed = -20;
	depth = -9999;
}