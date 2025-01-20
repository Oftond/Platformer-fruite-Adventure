event_inherited();

if (is_death)
	exit;

if (wait_timer > 0)
{
	wait_timer--;
	if (wait_timer <= 0)
		dir *= -1;
}

walk();