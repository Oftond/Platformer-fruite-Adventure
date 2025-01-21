event_inherited();

if (is_death || state == STATES.WALL_HIT)
	exit;
	
x += lengthdir_x(move_spd, dir);
y += lengthdir_y(move_spd, dir);

var _dir_to_change = 0;
if (place_meeting(x + lengthdir_x(move_spd, dir), y, obj_game_manager.collision_tilemap))
{
	is_fire = !is_fire;
	x -= lengthdir_x(move_spd, dir);
	_dir_to_change = (dir + 60) % 360;
	state = STATES.WALL_HIT;
}

if (place_meeting(x, y + lengthdir_y(move_spd, dir), obj_game_manager.collision_tilemap))
{
	is_fire = !is_fire;
	if (_dir_to_change == 0)
		_dir_to_change = (dir + 60) % 360;
	y -= lengthdir_x(move_spd, dir);
	state = STATES.WALL_HIT;
}

if (_dir_to_change != 0)
	dir = _dir_to_change;