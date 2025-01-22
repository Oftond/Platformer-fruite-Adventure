if (is_death)
{
	image_angle += 3;
	exit;
}

if ((place_meeting(x + move_spd * dir, y, obj_game_manager.collision_tilemap) || place_empty(x + 100 * dir, y + 50, obj_game_manager.collision_tilemap)) && state != STATES.IDLE)
{
	if (wait_timer <= 0 && state != STATES.ATTACK)
	{
		dir *= -1;
		wait_timer = wait_time;
		state = STATES.IDLE;
	}
	else if (wait_timer <= 0 && state == STATES.ATTACK)
		dir *= -1;
}

if (wait_timer <= 0 && state != STATES.HIT && state != STATES.ATTACK)
	state = STATES.WALK;

if (wait_timer <= 0)
{
	image_xscale = -dir;
	x += move_spd * dir;
}
else
	wait_timer--;