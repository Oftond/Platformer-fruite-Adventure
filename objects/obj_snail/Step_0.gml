if (is_death)
{
	image_angle += 3;
	exit;
}

var _is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap);

if (!_is_graunded)
	move_y += grav;
	
if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
{
	move_y = 0;
}

y += move_y;

if (current_hp < max_hp)
{
	if (place_meeting(x + (move_spd * dir), y, obj_game_manager.collision_tilemap))
	{
		dir *= -1;
	}
	
	x += move_spd * 2 * dir;
	exit;
}

if (place_meeting(x + (20 * sign(dir)) + (move_spd * dir), y, obj_game_manager.collision_tilemap) || place_empty(x + 100 * dir, y + 50, obj_game_manager.collision_tilemap))
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