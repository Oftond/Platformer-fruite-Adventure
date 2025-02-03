if (is_death || flashing > 0)
	exit;
	
var _x_sign = sign(x - other.x) == 0 ? image_xscale : sign(x - other.x);
move_x = _x_sign * 10;
get_damage(other.damage);
flashing = max_flashing;
is_knockback = true;
move_y = 0;
move_y -= jump_spd + 5;
current_jumps = 1;
state = STATES.HIT;
image_index = 0;
alarm[0] = time_to_knockback;