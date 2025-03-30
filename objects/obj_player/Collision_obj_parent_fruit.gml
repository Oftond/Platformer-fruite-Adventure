if (is_death || current_hp <= 0 || global.IsPause)
	exit;
score += other.give_score;
obj_game_manager.moneys++;
touch_fruit = other.sprite_index;
is_ripple_fruit = true;
instance_destroy(other);
is_ripple_fruit = true;