event_inherited();

move_x = move_spd * dir;

if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	dir *= -1;
}

image_xscale = -dir;
x += move_spd * dir;