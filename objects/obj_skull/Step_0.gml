event_inherited();

if (place_meeting(x + move_spd, y, obj_game_manager.collision_tilemap) || place_meeting(x, y + move_spd, obj_game_manager.collision_tilemap))
{
	direction = irandom(360);
}