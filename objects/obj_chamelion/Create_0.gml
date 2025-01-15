event_inherited();

sprite_run = spr_chamelion_run;
sprite_hit = spr_chamelion_hit;
sprite_attack = spr_chamelion_attack;
sprite_idle = spr_chamelion_idle;
max_hp = 3;
current_hp = max_hp;
move_spd = 2;
dir = choose(1, -1);
wait_time = 120;
detected_player = false;
detection_distance = sprite_width;
name = "chamelion";