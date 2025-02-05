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
change_dir_left = 0;
change_dir_right = 0;