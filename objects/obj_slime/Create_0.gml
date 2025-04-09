event_inherited();

sprite_run = spr_slime_run;
sprite_hit = spr_slime_hit;
name = "slime";
move_spd = 2;
max_hp = 1;
current_hp = max_hp;
dir = choose(1, -1);
wait_time = 20;
alarm[0] = wait_time;
score_drop = 80;