if (global.IsPause) exit;

if (is_death || state == STATES.HIT)
	exit;

if (wait_timer > 0)
{
	wait_timer--;
	if (wait_timer <= 0)
		dir *= -1;
}

walk();