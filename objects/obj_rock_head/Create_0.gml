event_inherited();

dir = DIRECTIONS.LEFT;
move_spd = 1;
max_move_spd = 16;
move_x = 0;
move_y = 0;
wait_timer = 0;
wait_time = 60;
sprite_idle = sprite_index;
sprite_hit_left = spr_rock_head_left_hit;
sprite_hit_right = spr_rock_head_right_hit;
sprite_hit_top = spr_rock_head_top_hit;
sprite_hit_bottom = spr_rock_head_bottom_hit;

set_hit_sprite = function(_sprite_hit)
{
	image_index = 0;
	sprite_index = _sprite_hit;
}