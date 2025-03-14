if (is_death || flashing > 0 || state == STATES.HIT)
	exit;
	
if (other.is_death)
	exit;

if (move_y >= 0 && !other.is_fire)
{
	if ((bbox_bottom - move_y) < bbox_bottom)
	{
		if (state != STATES.HIT)
			other.current_hp -= damage;
		move_y = 0;
		move_y -= jump_spd + 5;
		current_jumps = 1;
		with (other)
		{
			if (state != STATES.HIT)
				image_index = 0;
			state = STATES.HIT;
		}
		exit;
	}
}

if (flashing > 0)
{
	exit;
}

with (other)
{
	if (state == STATES.HIT)
	{
		exit;
	}
}

var _x_sign = sign(x - other.x) == 0 ? image_xscale : sign(x - other.x);

move_y = 0;
move_y -= jump_spd + 5;
current_jumps = 1;
move_x = _x_sign * 10;
get_damage(damage);
flashing = max_flashing;
is_knockback = true;
state = STATES.HIT;
image_index = 0;
alarm[0] = time_to_knockback;