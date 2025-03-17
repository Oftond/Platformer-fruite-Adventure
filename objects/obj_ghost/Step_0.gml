event_inherited();

if (is_death || state == STATES.HIT)
	exit;

move_x = move_spd * dir;
	
if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap) || (place_empty(x + move_x, y + 100, obj_game_manager.collision_tilemap) && place_empty(x + move_x, y + 100, obj_game_manager.traps_layer_ice) && place_empty(x + move_x, y + 100, obj_game_manager.traps_layer_sand)))
{
	dir *= -1;
	move_x = 0;
}

if (state != STATES.APPEAR && state != STATES.DESAPPEAR && state != STATES.HIT)
	state = STATES.IDLE;

image_xscale = -dir;
x += move_x;

if (is_visible && state != STATES.IDLE)
	state = STATES.APPEAR;
else if (!is_visible && state != STATES.DESAPPEAR)
	state = STATES.DESAPPEAR;