if (is_death)
{
	image_angle += 3;
	exit;
}

is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap);

if (wait_timer > 0)
	wait_timer--;

if (!is_graunded)
{
	move_y += grav;
}

var _find_player = instance_nearest(x, y, obj_player);
var _check_wall = noone;
if (_find_player != noone)
	_check_wall = collision_line(x, y, _find_player.x, _find_player.y, obj_game_manager.collision_tilemap, true, true);

if (_find_player != noone && _check_wall == noone)
{
	state = STATES.ATTACK;
	dir = sign(round(_find_player.x - x)) != 0 ? sign(round(_find_player.x - x)) : image_xscale;
	move_x = move_spd * dir;
	if (wait_timer <= 0 && y > _find_player.y && can_jump)
	{
		can_jump = false;
		jump_height = _find_player.y;
	}
	if (y >= jump_height && !can_jump && wait_timer<= 0)
		move_y = -jump_spd;
	else if (!can_jump && wait_timer <= 0 && y < jump_height)
	{
		wait_timer = wait_time;
		jump_height = 0;
	}
}
else
{
	move_x = 0;
	state = STATES.IDLE;
}

var _sub_pixel = 0.5;
if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
}

if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
	can_jump = true;
	wait_timer = wait_time;
}

image_xscale = -dir;

if (move_y < 0)
	state = STATES.JUMP;
else if (move_y >= 0 && !is_graunded)
	state = STATES.FALL;

x += move_x;
y += move_y;