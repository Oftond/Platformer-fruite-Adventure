if (is_death)
{
	image_angle += 3;
	exit;
}

if (wait_timer > 0)
	wait_timer--;

dected_player();

if (is_detected_player)
	move_x = dir * move_spd;

var _sub_pixel = 0.5;
if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
	if (can_jump && place_empty(x + dir, y - 200, obj_game_manager.collision_tilemap))
	{
		can_jump = false;
		move_y = jump_height;
	}
}
else if (place_meeting(x + move_x, y, obj_game_manager.traps_layer_sand))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.traps_layer_sand))
		x += _pixel_check;
	move_x = 0;
	if (can_jump && place_empty(x + dir, y - 200, obj_game_manager.traps_layer_sand))
	{
		can_jump = false;
		move_y = jump_height;
	}
}
else if (place_meeting(x + move_x, y, obj_game_manager.traps_layer_ice))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.traps_layer_ice))
		x += _pixel_check;
	move_x = 0;
	if (can_jump && place_empty(x + dir, y - 200, obj_game_manager.traps_layer_ice))
	{
		can_jump = false;
		move_y = jump_height;
	}
}
else if (place_meeting(x + move_x, y, obj_parent_trap))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_parent_trap))
		x += _pixel_check;
	move_x = 0;
	if (can_jump && place_empty(x + dir, y - 200, obj_parent_trap))
	{
		can_jump = false;
		move_y = jump_height;
	}
}

if ((place_empty(x + 5 * dir, y + 50, obj_game_manager.collision_tilemap) && place_empty(x + 5 * dir, y + 50, obj_game_manager.traps_layer_sand) && place_empty(x + 5 * dir, y + 50, obj_game_manager.traps_layer_ice) && place_empty(x + 5 * dir, y + 50, obj_parent_trap)) && can_jump && instance_exists(obj_player))
{
	if (obj_player.y < y + 20)
	{
		move_y = jump_height;
		can_jump = false;
	}
}

if (instance_exists(obj_player) && is_detected_player)
{
	if ((x + 100 <= obj_player.x || x - 100 >= obj_player.x))
		dir = sign(x - obj_player.x) == 0 ? image_xscale : sign(obj_player.x - x);
}

if (move_x !=0 && state != STATES.HIT)
	state = STATES.WALK;
else if (state != STATES.HIT)
	state = STATES.IDLE;

jump();

image_xscale = -dir;

x += move_x;