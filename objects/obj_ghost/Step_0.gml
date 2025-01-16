event_inherited();

if (is_death)
	exit;

move_x = move_spd * dir;
	
if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	dir *= -1;
	move_x = 0;
}

if (state != STATES.APPEAR && state != STATES.DESAPPEAR)
	state = STATES.IDLE;

image_xscale = -dir;
x += move_x;

if (is_visible && state != STATES.IDLE)
	state = STATES.APPEAR;
else if (!is_visible && state != STATES.DESAPPEAR)
	state = STATES.DESAPPEAR;