//if (is_death || (other.name == "turtle" && other.state == STATES.ATTACK) || (other.name == "ghost" && (other.state == STATES.DESAPPEAR || other.state == STATES.APPEAR)) || other.name == "skull" || other.is_death && flashing > 0 || other.state == STATES.HIT || is_knockback)
//{
//	exit;
//}
	
//if (move_y > 0)
//{
//	if ((bbox_bottom - move_y) < (other.bbox_top - other.move_y))
//	{
//		if (state != STATES.HIT)
//			other.current_hp -= damage;
//		move_y = 0;
//		move_y -= jump_spd + 5;
//		current_jumps = 1;
//		if (other.state != STATES.HIT)
//			other.image_index = 0;
//		other.state = STATES.HIT;
//		exit;
//	}
//}
	
//var _x_sign = sign(x - other.x) == 0 ? image_xscale : sign(x - other.x);

//move_y = 0;
//move_y -= jump_spd + 5;
//current_jumps = 1;
//move_x = _x_sign * 10;
//get_damage(other.damage);
//flashing = max_flashing;
//is_knockback = true;
//state = STATES.HIT;
//image_index = 0;
//alarm[0] = time_to_knockback;