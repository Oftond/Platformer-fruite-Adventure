event_inherited();

sprite_jump = spr_duck_jump;
sprite_hit = spr_duck_hit;
sprite_fall = spr_duck_fall;
sprite_idle = spr_duck_idle;
sprite_jump_anticapation = spr_duck_jump_anticipation;
dir = choose(1, -1);
wait_time = 120;
wait_timer = wait_time;
can_jump = true;
jump_height = 0;
jump_spd = 20;
move_spd = 6;
name = "duck";
sprite_attack_hitBox = spr_duck_getDamage_hitBox;

create_hitBox();