if (is_death || (other.enemy.name == "turtle" && other.enemy.state == STATES.ATTACK) || (other.enemy.name == "ghost" && (other.enemy.state == STATES.DESAPPEAR || other.enemy.state == STATES.APPEAR)) || other.enemy.name == "skull" || other.enemy.is_death)
{
	exit;
}

if (move_y >= 0)
{
	if ((bbox_bottom - move_y) < (other.bbox_top - other.enemy.move_y))
	{
		if (state != STATES.HIT)
			other.enemy.current_hp -= damage;
		move_y = 0;
		move_y -= jump_spd + 5;
		current_jumps = 1;
		with (other)
		{
			if (enemy.state != STATES.HIT)
				enemy.image_index = 0;
			enemy.state = STATES.HIT;
		}
		exit;
	}
}