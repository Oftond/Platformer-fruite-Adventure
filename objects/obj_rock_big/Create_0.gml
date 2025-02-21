event_inherited();

sprite_run = spr_rock_1_run;
sprite_idle = spr_rock_1_idle;
sprite_hit = spr_rock_1_hit;
move_spd = 2;
dir = choose(1, -1);
wait_time = 120;
death_time = 5;
name = "rock1";
create_middle_rocks = false;

create_hitBox();

walk = function()
{
	move_x = move_spd * dir;
	
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

	if (move_x != 0)
		state = STATES.WALK;
	
	image_xscale = -dir;
	x += move_x;
}