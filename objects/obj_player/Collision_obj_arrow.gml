if (is_death || current_hp <= 0)
	exit;

with (other)
{
	if (off)
		exit;
	destroy = true;
}

move_y = -25;
current_jumps--;

if (jump_timer > 0)
	jump_timer = 0;