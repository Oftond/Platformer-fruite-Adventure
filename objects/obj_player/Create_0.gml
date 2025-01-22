event_inherited();
move_wall_spd = 6;
move_locked_max_time = 10;
move_locked_time = 0;
on_wall = 0;
on_arrow = false;
global.RespownX = x;
global.RespownY = y;
mask_index = spr_player_maskCollide;

instance_create_layer(x, y, "Menegers", obj_camera);