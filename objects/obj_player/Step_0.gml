if (is_death)
{
	if (y > room_height + 175)
		speed = 0;
	if (!instance_exists(obj_transition))
		instance_create_layer(0, 0, "GUI", obj_transition);
	image_angle += 3;
	exit;
}
else if (y > room_height + 175)
	get_damage(current_hp);

if (cooldown_parts > 0) cooldown_parts--;

var _dir = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left)|| keyboard_check(ord("A")));
var _jump_key_pressed = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));
var _jump_key_hold = keyboard_check(vk_up) || keyboard_check(vk_space) || keyboard_check(ord("W"));
is_graunded = ((place_meeting(x, y + 1, obj_game_manager.collision_tilemap)) || (place_meeting(x, y + 1, obj_parent_trap)) || (place_meeting(x, y + 1, obj_game_manager.traps_layer_sand)) || (place_meeting(x, y + 1, obj_game_manager.traps_layer_ice)));
on_wall = place_meeting(x - 1, y, obj_game_manager.collision_tilemap) - place_meeting(x + 1, y, obj_game_manager.collision_tilemap);
on_ice = place_meeting(x, y + max(1, move_y), obj_game_manager.traps_layer_ice) && !place_meeting(x, y + max(1, move_y), obj_game_manager.collision_tilemap);

move_locked_time = max(move_locked_time - 1, 0);

if (place_meeting(x, y + max(1, move_y), obj_end) && bbox_bottom <= obj_end.bbox_top && move_y > 0 && !obj_end.is_touch)
{
	move_y = 0;
	move_y -= jump_spd + 15;
	obj_end.press();
}

if (place_meeting(x, y + max(1, move_y), obj_parent_move_platform))
{
	var _platform = instance_place(x, y + max(1, move_y), obj_parent_move_platform);
	if (bbox_bottom <= _platform.bbox_top)
	{
		is_graunded = true;
	}
}

if (place_meeting(x, y + max(1, move_y), obj_platform_brown))
{
	var _platform = instance_place(x, y + max(1, move_y), obj_platform_brown);
	if (bbox_bottom <= _platform.bbox_top)
	{
		_platform.start_move = true;
	}
}
else
{
	with (obj_platform_brown)
	{
		start_move = false;
	}
}

if (place_meeting(x, y + max(1, move_y), obj_trampoline))
{
	var _trampoline = instance_place(x, y + max(1, move_y), obj_trampoline);
	if (bbox_bottom <= _trampoline.bbox_top && _trampoline.state == STATES.IDLE)
	{
		_trampoline.state = STATES.HIT;
	}
}

if (!is_knockback)
{
	if (is_graunded)
	{
		current_jumps = 0;
		if (move_x != 0 && _dir != 0)
			state = STATES.WALK;
		else
			state = STATES.IDLE;
	}
	else if (move_y >= 0 && on_wall != 0)
	{
		current_jumps = 0;
		state = STATES.WALL_JUMP;
	}
	else
	{
		if (current_jumps == 0)
			current_jumps = 1;
	}
	
	if (move_locked_time <= 0)
	{
		if (_dir != 0)
			image_xscale = sign(_dir);
		
		if (on_ice)
		{
			if (inertia != 0 && _dir != 0)
			{
		        inertia *= ice_speed_multiplier;
		        inertia = clamp(inertia, -max_x_speed, max_x_speed);
			}
		}
		
		if (!is_graunded && inertia != 0) move_x = inertia;
		
		if (inertia != 0 && is_graunded && !on_ice)
		{
			if (_dir != 0)
			{
				inertia = 0;
				move_x = inertia;
			}
			else
			{
				inertia = lerp(inertia, 0, deceleration);
				move_x = inertia;
				if (abs(inertia) < 0.1) inertia = 0;
			}
		}
		
		if (_dir != sign(inertia) && _dir != 0 && inertia != 0)
		{
			inertia = lerp(inertia, 0, turn_deceleration);
			if (abs(inertia) < min_turn_speed)
			{
				move_x = _dir * move_spd;
				if (on_ice) inertia = move_x;
				else inertia = 0;
			}
			else move_x = inertia;
		}
		else if (inertia != 0) move_x = inertia;
		else
		{
			move_x = _dir * move_spd;
			if (inertia == 0 && on_ice) inertia = move_x;
		}
		
		if (move_x == 0 && inertia != 0) move_x = inertia;
		
		if (_jump_key_pressed && current_jumps < max_jumps)
		{
			dust_jump_create(spr_dust_part, image_xscale, self);
			current_jumps++;
			jump_timer = jump_hold_time;
			if (!is_graunded)
			{
				state = STATES.DOUBLE_JUMP;
				image_index = 0;
			}
			if (on_wall != 0 && !is_graunded && move_y >= 0)
			{
				move_x = on_wall * move_wall_spd;
				move_locked_time = move_locked_max_time;
				state = STATES.JUMP;
			}
		}
	}
	
	if (!_jump_key_hold)
		jump_timer = 0;
		
	if (jump_timer > 0)
	{
		move_y = -jump_spd;
		jump_timer--;
	}
}

if (move_y < 0 && !is_graunded)
{
	if (!is_knockback && state != STATES.DOUBLE_JUMP)
		state = STATES.JUMP;
	if (on_wall != 0)
		move_y = min(move_y + 1, 3);
	else
		move_y += grav;
}
else if (move_y >= 0 && !is_graunded)
{
	if (!is_knockback)
	{
		if (on_wall == 0)
			state = STATES.FALL;
	}
	if (on_wall != 0)
	{
		move_y = min(move_y + 1, 3);
		image_xscale = sign(-on_wall);
	}
	else
	{
		move_y += grav;
	}
}

var _sub_pixel = 0.5;
if (place_meeting(x, y + max(1, move_y), obj_parent_move_platform))
{
	var _platform = instance_place(x, y + max(1, move_y), obj_parent_move_platform);
	if (bbox_bottom <= _platform.bbox_top)
	{
		if (move_y > 0)
		{
			var _pixel_check = _sub_pixel * sign(move_y);
			while (!place_meeting(x, y + _pixel_check, obj_parent_move_platform))
				y += _pixel_check;
			move_y = 0;
		}
		if (!place_meeting(x + _platform.move_x, y, obj_game_manager.collision_tilemap) && !place_meeting(x, y + _platform.move_y, obj_game_manager.collision_tilemap))
		{
			y += _platform.move_y;
			x += _platform.move_x;
		}
	}
}

if (place_meeting(x, y + 1, obj_rock_head))
{
	var _head = instance_place(x, y + 1, obj_rock_head);
	if (bbox_bottom <= _head.bbox_top)
	{
		if (!place_meeting(x + _head.move_x, y, obj_game_manager.collision_tilemap) && !place_meeting(x, y + _head.move_y, obj_game_manager.collision_tilemap) && !place_meeting(x + _head.move_x, y, obj_game_manager.traps_layer_ice) && !place_meeting(x, y + _head.move_y, obj_game_manager.traps_layer_ice) && !place_meeting(x + _head.move_x, y, obj_game_manager.traps_layer_sand) && !place_meeting(x, y + _head.move_y, obj_game_manager.traps_layer_sand))
			x += _head.move_x;
	}
}

if (place_meeting(x, y + max(1, move_y), obj_fire))
{
	var _collision_fire = ds_list_create();
	var _num_block_fire = instance_place_list(x, y + max(1, move_y), obj_fire, _collision_fire, false);
	for (var i = 0; i < _num_block_fire; i++)
	{
		with (instance_place(x, y + max(1, move_y), _collision_fire[| i]))
		{
			if (state == STATES.ATTACK)
			{
				if (other.flashing == 0)
				{
					var _x_sign = sign(other.x - x);
					other.move_x = _x_sign * 10;
					other.get_damage(1);
					if (other.current_hp > 0)
						other.flashing = other.max_flashing;
					other.is_knockback = true;
					other.move_y = 0;
					other.move_y -= other.jump_spd + 5;
					other.current_jumps = 1;
					other.state = STATES.HIT;
					other.image_index = 0;
					other.alarm[0] = other.time_to_knockback;
				}
			}
			else if (other.bbox_bottom <= bbox_top && state == STATES.IDLE)
				state = STATES.HIT;
		}
	}
	ds_list_destroy(_collision_fire);
}

if (place_meeting(x + move_x, y, obj_parent_trap))
{
	x -= move_x;
	var _trap = instance_place(x, y +  max(0, move_y), obj_parent_trap);
	var _get_damage = false;
	with(_trap)
	{
		if (_trap.state == STATES.ATTACK)
		{
			_get_damage = true;
		}
	}
	if (!_get_damage)
	{
		var _pixel_check = _sub_pixel * sign(move_x);
		while (!place_meeting(x + _pixel_check, y, obj_parent_trap))
			x += _pixel_check;
		move_x = 0;
	}
}

if (place_meeting(x, y + move_y, obj_parent_trap))
{
	y -= move_y;
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_parent_trap))
		y += _pixel_check;
	move_y = 0;
	jump_timer = 0;
}

if (place_meeting(x + move_x, y, obj_game_manager.traps_layer_sand))
{
	x -= move_x;
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.traps_layer_sand))
		x += _pixel_check;
	move_x = 0;
}

if (place_meeting(x + move_x, y, obj_game_manager.traps_layer_ice))
{
	x -= move_x;
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.traps_layer_ice))
		x += _pixel_check;
	move_x = 0;
}

if (place_meeting(x, y + move_y, obj_game_manager.traps_layer_sand))
{
	y -= move_y;
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_sand))
		y += _pixel_check;
	move_y = 0;
	jump_timer = 0;
}

if (place_meeting(x, y + move_y, obj_game_manager.traps_layer_ice))
{
	y -= move_y;
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.traps_layer_ice))
		y += _pixel_check;
	move_y = 0;
	jump_timer = 0;
}

if (place_meeting(x, y + max(1, move_y), obj_game_manager.traps_layer_sand) && !place_meeting(x, y + max(1, move_y), obj_game_manager.collision_tilemap))
{
	if (move_x != 0)
		move_x = round(move_x / 2);
}

if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap))
{
	x -= move_x;
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
	inertia = 0;
}

if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
{
	y -= move_y;
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
	jump_timer = 0;
}

move_y = clamp(move_y, -max_y_speed, max_y_speed);

if (is_graunded && move_x != 0)
{
	if (place_meeting(x, y + 1, obj_game_manager.collision_tilemap))
		dust_create(part_dust, image_xscale, self);
	else if (place_meeting(x, y + 1, obj_game_manager.traps_layer_sand))
		dust_create(part_sand, image_xscale, self);
	else if (place_meeting(x, y + 1, obj_game_manager.traps_layer_ice))
		dust_create(part_ice, image_xscale, self);
}

x += move_x;
y += move_y;

if (place_meeting(x, y - 1, obj_block))
{
	var _collision_blocks = ds_list_create();
	var _num_blocks = instance_place_list(x, y - 1, obj_block, _collision_blocks, false);
	for (var i = 0; i < _num_blocks; i++)
	{
		with (instance_place(x, y - 1, _collision_blocks[| i]))
		{
			durability--;
			state = STATES.HIT;
			image_index = 0;
		}
	}
	ds_list_destroy(_collision_blocks);
}

if (place_meeting(x, y + max(1, move_y), obj_falling_platform))
{
	var _platform = instance_place(x, y + max(1, move_y), obj_falling_platform);
	if (bbox_bottom <= _platform.bbox_top)
	{
		_platform.set_fall_time();
	}
}

event_inherited();

check_collision_enemy();