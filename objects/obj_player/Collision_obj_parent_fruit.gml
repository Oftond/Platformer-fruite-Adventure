if (is_death || current_hp <= 0)
	exit;
score += other.give_score;
instance_destroy(other);