if (is_death || current_hp <= 0)
	exit;
score += other.give_score;
touch_fruit = other.sprite_index;
instance_destroy(other);