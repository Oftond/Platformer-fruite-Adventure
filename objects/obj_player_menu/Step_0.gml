var _dir = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left)|| keyboard_check(ord("A")));
var _jump_key_pressed = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space);
var _jump_key_hold = keyboard_check(vk_up) || keyboard_check(vk_space);
is_graunded = ((place_meeting(x, y + 1, obj_menu_manager.collision_tilemap)));

move_locked_time = max(move_locked_time - 1, 0);

if (is_graunded)
{
	current_jumps = 0;
	if (_dir != 0)
		state = STATES.WALK;
	else
		state = STATES.IDLE;
}
else if (move_y >= 0)
{
	current_jumps = 0;
	state = STATES.WALL_JUMP;
}
else
{
	if (current_jumps == 0)
		current_jumps = 1;
}

if (_dir != 0)
	image_xscale = sign(_dir);
move_x = _dir * move_spd;

if (_jump_key_pressed && current_jumps < max_jumps)
{
	current_jumps++;
	jump_timer = jump_hold_time;
	if (!is_graunded)
	{
		state = STATES.DOUBLE_JUMP;
		image_index = 0;
	}
	if (!is_graunded && move_y >= 0)
		state = STATES.JUMP;
}

if (!_jump_key_hold)
	jump_timer = 0;
	
if (jump_timer > 0)
{
	move_y = -(jump_spd / max(current_jumps, 1));
	jump_timer--;
}

if (move_y < 0 && !is_graunded)
{
	if (state != STATES.DOUBLE_JUMP)
		state = STATES.JUMP;
	move_y += grav;
}
else if (move_y >= 0 && !is_graunded)
{
	state = STATES.FALL;
	move_y += grav;
}

var _sub_pixel = 0.5;
if (place_meeting(x, y + move_y, obj_menu_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_menu_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
	jump_timer = 0;
}

if (place_meeting(x + move_x, y, obj_menu_manager.collision_tilemap))
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_menu_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
}

x += move_x;
y += move_y;