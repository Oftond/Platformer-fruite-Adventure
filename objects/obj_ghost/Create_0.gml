event_inherited();

sprite_desappear = spr_ghost_desappear;
sprite_appear = spr_ghost_appear;
sprite_idle = spr_ghost_idle;
sprite_hit = spr_ghost_hit;
move_spd = 2;
dir = choose(1, -1);
wait_time = 240;
is_visible = true;
alarm[0] = wait_time;
name = "ghost";

create_hitBox();