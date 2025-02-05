event_inherited();

if (state == STATES.ANTICIPATION || is_death)
	exit;

is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap);

if (wait_timer > 0)
	wait_timer--;

if (!is_graunded)
{
	move_y += grav;
}
else
	state = STATES.IDLE;

if (wait_timer <= 0)
	move_x = move_spd * dir;
	
if (can_jump && is_graunded && wait_timer <= 0 && state != STATES.ANTICIPATION)
	state = STATES.ANTICIPATION;

if (x + move_x <= change_dir_left || x + move_x >= change_dir_right)
{
	dir *= -1;
}

var _sub_pixel = 0.5;
if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
	//wait_timer = wait_time;
	//dir *= -1;
}

if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
	can_jump = true;
	wait_timer = wait_time;
	move_x = 0;
}

image_xscale = -dir;

if (move_y < 0)
	state = STATES.JUMP;
else if (move_y >= 0 && !is_graunded)
	state = STATES.FALL;

x += move_x;
y += move_y;