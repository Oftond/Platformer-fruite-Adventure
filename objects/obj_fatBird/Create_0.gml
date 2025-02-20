event_inherited();

sprite_ground = spr_fatBird_ground;
sprite_fall = spr_fatBird_fall;
sprite_idle = spr_fatBird_idle;
sprite_hit = spr_fatBird_hit;
move_spd = 2;
dir = choose(1, -1);
wait_time = 30;
name = "fat bird";

player_detected = false;
y_pos_to_fly = y;

curve = curv_fly_fatBird;
curvPosition = 0;
curvSpeed = 0.01;