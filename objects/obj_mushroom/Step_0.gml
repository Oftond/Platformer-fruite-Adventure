if (is_death)
{
	image_angle += 3;
	exit;
}

if (place_meeting(x + move_spd * dir, y, obj_game_manager.collision_tilemap))
{
	if (wait_timer <= 0)
	{
		dir *= -1;
		wait_timer = wait_time;
		state = STATES.IDLE;
	}
}

if (wait_timer <= 0)
	state = STATES.WALK;

if (wait_timer <= 0)
{
	image_xscale = -dir;
	x += move_spd * dir;
}
else
	wait_timer--;