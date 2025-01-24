if (is_death || (other.name == "turtle" && other.state == STATES.ATTACK) || (other.name == "ghost" && (other.state == STATES.DESAPPEAR || other.state == STATES.APPEAR)) || other.name == "skull" || other.is_death && flashing > 0 || other.state == STATES.HIT)
{
	exit;
}

var _x_sign = sign(x - other.x) == 0 ? image_xscale : sign(x - other.x);

move_y = 0;
move_y -= jump_spd + 5;
current_jumps = 1;
move_x = _x_sign * 10;
current_hp -= other.damage;
flashing = max_flashing;
is_knockback = true;
state = STATES.HIT;
image_index = 0;
alarm[0] = time_to_knockback;