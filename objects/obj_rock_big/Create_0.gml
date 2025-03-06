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

walk = function()
{
	move_x = move_spd * dir;
	
	if (place_meeting(x + move_x, y, obj_game_manager.collision_tilemap) || (place_empty(x + 150 * dir, y + 50, obj_game_manager.collision_tilemap) && place_empty(x + 150 * dir, y + 50, obj_game_manager.traps_layer_sand) && place_empty(x + 150 * dir, y + 50, obj_game_manager.traps_layer_ice)))
	{
		if (state != STATES.HIT) state = STATES.IDLE;
		move_x = 0;
		if (wait_timer <= 0)
		{
			wait_timer = wait_time;
		}
	}

	if (move_x != 0 && state != STATES.HIT) state = STATES.WALK;
	
	image_xscale = -dir;
	x += move_x;
}