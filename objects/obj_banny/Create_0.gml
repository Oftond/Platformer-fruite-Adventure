event_inherited();
sprite_hit = spr_banny_hit;
sprite_idle = spr_banny_idle;
sprite_run = spr_banny_run;
sprite_jump = spr_banny_jump;
sprite_fall = spr_banny_fall;
move_spd = 2;
dir = choose(1, -1);
wait_time = 120;
can_jump = true;
jump_height = 0;
name = "banny";

create_hitBox();