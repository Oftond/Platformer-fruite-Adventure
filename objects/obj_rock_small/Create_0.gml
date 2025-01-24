event_inherited();

sprite_run = spr_rock_3_run;
sprite_idle = spr_rock_3_idle;
sprite_hit = spr_rock_3_hit;
move_spd = 2;
dir = choose(1, -1);
wait_time = 120;
can_jump = true;
jump_height = 0;
name = "rock3";

death_time = 5;
create_small_rocks = false;

create_hitBox();

walk = function()
{
	move_x = move_spd * dir;
	
	is_graunded = place_meeting(x, y + 1, obj_game_manager.collision_tilemap);
	
	if (!is_graunded)
	{
		move_y += grav;
	}
	
	var _sub_pixel = 0.5;
	if (place_meeting(x + move_x, y - 10, obj_game_manager.collision_tilemap))
	{
		var _pixel_check = _sub_pixel * sign(move_x);
		while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
			x += _pixel_check;
		move_x = 0;
		if (wait_timer <= 0)
		{
			wait_timer = wait_time;
			state = STATES.IDLE;
		}
	}
	
	if (place_meeting(x, y + move_y, obj_game_manager.collision_tilemap))
	{
		var _pixel_check = _sub_pixel * sign(move_y);
		while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
			y += _pixel_check;
		move_y = 0;
	}

	if (move_x != 0)
		state = STATES.WALK;
	
	image_xscale = -dir;
	x += move_x;
	y += move_y;
}