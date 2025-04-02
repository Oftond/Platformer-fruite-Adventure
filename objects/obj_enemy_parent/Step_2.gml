if (global.IsPause) exit;

if (current_hp <= 0 && !is_death)
{
	current_hp = 0;
	is_death = true;
	speed = 0;
	direction = 0;
	gravity = 1.5;
	vspeed = -20;
	depth = -9999;
	SetSoundPlay(sound_of_death);
}