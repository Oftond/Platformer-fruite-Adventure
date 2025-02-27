event_inherited();

sprite_jump = spr_duck_jump;
sprite_hit = spr_duck_hit;
sprite_fall = spr_duck_fall;
sprite_idle = spr_duck_idle;
sprite_jump_anticapation = spr_duck_jump_anticipation;
dir = choose(1, -1);
wait_time = 30;
wait_timer = wait_time;
can_jump = true;
jump_height = 0;
jump_spd = 22;
move_spd = 6;
name = "duck";

try_change_dir = function()
{
	if ((place_meeting(x + move_x, y, obj_game_manager.collision_tilemap) && !place_empty(x + move_x, y - 200, obj_game_manager.collision_tilemap) && is_graunded) || place_empty(x + move_x * 10, y + 400, obj_game_manager.collision_tilemap)) dir *= -1;
}