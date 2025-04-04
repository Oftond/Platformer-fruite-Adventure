if (global.IsPause) exit;

if (is_death)
{
	image_angle += 3;
	exit;
}

if (place_meeting(x + move_spd * dir, y, obj_game_manager.collision_tilemap) || place_empty(x + 100 * dir, y + 50, obj_game_manager.collision_tilemap) || place_meeting(x + move_spd * dir, y, obj_game_manager.secret_walls))
{
	if (wait_timer <= 0)
	{
		dir *= -1;
		wait_timer = wait_time;
		state = STATES.IDLE;
	}
}

if (wait_timer <= 0 && state != STATES.HIT)
	state = STATES.WALK;

if (wait_timer <= 0)
{
	image_xscale = -dir;
	x += move_spd * dir;
}
else
	wait_timer--;