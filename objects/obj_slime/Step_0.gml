if (global.IsPause) exit;

event_inherited();
if (is_death || state == STATES.HIT) exit;

move_x = move_spd * dir;

if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap) || place_empty(x + 180 * dir, y + 50, obj_game_manager.collision_tilemap))
{
	dir *= -1;
}

image_xscale = -dir;
x += move_spd * dir;