event_inherited();

if (is_death && state == STATES.WALL_HIT)
	exit;

var _sub_pixel = 0.5;
if (place_meeting(x + move_spd, y, obj_game_manager.collision_tilemap))
{
	wait_timer = wait_time;
	direction = (direction + 60) % 360;
	is_fire = !is_fire;
	var _pixel_check = _sub_pixel * sign(move_spd);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	state = STATES.WALL_HIT;
	exit;
}

if (place_meeting(x, y + move_spd, obj_game_manager.collision_tilemap))
{
	wait_timer = wait_time;
	direction = (direction + 60) % 360;
	is_fire = !is_fire;
	var _pixel_check = _sub_pixel * sign(move_spd);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	state = STATES.WALL_HIT;
}