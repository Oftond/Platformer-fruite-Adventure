event_inherited();

sprite_idle_fly = spr_radish_idle_1;
sprite_idle_ground = spr_radish_idle_2;
sprite_hit = spr_radish_hit;
sprite_run = spr_radish_run;
sprite_leafs_left = spr_radish_leafs_left;
sprite_leafs_right = spr_radish_leafs_right;
move_spd = 2;
dir = choose(1, -1);
wait_time = 60;
name = "radish";

max_hp = 2;
current_hp = max_hp;

curve = curv_fly_blueBird;
curvPosition = 0;
curvSpeed = 0.01;

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
	{
		state = STATES.WALK;
	}
	image_xscale = -dir;
	x += move_x;
}