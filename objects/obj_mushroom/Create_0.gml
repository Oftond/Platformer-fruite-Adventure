event_inherited();
sprite_hit = spr_mushroom_hit;
move_spd = 2;
dir = choose(1, -1);
wait_time = 120;
name = "mushroom";
sprite_attack_hitBox = spr_mushroom_getDamage_hitBox;

create_hitBox();