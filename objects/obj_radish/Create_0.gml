event_inherited();

sprite_idle_fly = spr_radish_idle_1;
sprite_idle_ground = spr_radish_idle_2;
sprite_hit = spr_radish_hit;
sprite_run = spr_radish_run;
sprite_leafs_left = spr_radish_leafs_left;
sprite_leafs_right = spr_radish_leafs_right;
move_spd = 2;
dir = choose(1, -1);
wait_time = 120;
name = "radish";

curve = curv_fly_blueBird;
curvPosition = 0;
curvSpeed = 0.01;