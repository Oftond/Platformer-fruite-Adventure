event_inherited();
damage = 1;
max_hp = 1;
current_hp = max_hp;
wait_timer = 0;
wait_time = 60;
name = "enemy";
start_pos_x = x;
start_pos_y = y;
dir = 1;
score_drop = 10;
sound_of_death = OGG_Enemy_Death1;

get_damage = function(_damage)
{
	if (!instance_exists(obj_player)) return;
	
	if (obj_player.state != STATES.HIT)
		current_hp -= _damage;
	
	if (state != STATES.HIT)
		image_index = 0;
	
	state = STATES.HIT;
	score += score_drop;
	SetSoundPlay(sound_of_death);
}