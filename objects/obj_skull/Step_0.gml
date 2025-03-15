if (parts != pointer_null) part_system_position(parts, x, y);
event_inherited();

if (!player_come && instance_exists(obj_player))
{
	if (distance_to_object(obj_player) < 2000) player_come = true;
}

if (is_death || !player_come)
	exit;
	
x += lengthdir_x(move_spd, dir);
y += lengthdir_y(move_spd, dir);

var _dir_to_change = 0;
if (place_meeting(x + lengthdir_x(move_spd, dir), y, obj_game_manager.collision_tilemap))
{
	is_fire = !is_fire;
	x -= lengthdir_x(move_spd * 2, dir);
	_dir_to_change = 180 + dir;
	_dir_to_change += random_range(-30, 30);
	state = STATES.WALL_HIT;
}
if (place_meeting(x, y + lengthdir_y(move_spd, dir), obj_game_manager.collision_tilemap))
{
	is_fire = !is_fire;
	_dir_to_change = 180 + dir;
	_dir_to_change += random_range(-30, 30);
	y -= lengthdir_x(move_spd * 2, dir);
	state = STATES.WALL_HIT;
}

if (_dir_to_change != 0)
	dir = _dir_to_change;