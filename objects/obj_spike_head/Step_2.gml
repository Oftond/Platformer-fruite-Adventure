if (wait_timer > 0)
{
	wait_timer--;
	move_x = 0;
	move_y = 0;
	exit;
}

switch(dir)
{
	case DIRECTIONS.LEFT:
		move_x -= move_spd;
		move_y = 0;
	break;
	
	case DIRECTIONS.TOP:
		move_y -= move_spd;
		move_x = 0;
	break;
	
	case DIRECTIONS.RIGHT:
		move_x += move_spd;
		move_y = 0;
	break;
	
	case DIRECTIONS.BOTTOM:
		move_y += move_spd;
		move_x = 0;
	break;
}

if (move_x < -max_move_spd)
	move_x = -max_move_spd;
else if (move_x > max_move_spd)
	move_x = max_move_spd;
else if (move_y > max_move_spd)
	move_y = max_move_spd;
else if (move_y < -max_move_spd)
	move_y = -max_move_spd;

var _sub_pixel = 0.5;
if (tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_left + move_x, y) && dir == DIRECTIONS.LEFT)
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
	wait_timer = wait_time;
	set_hit_sprite(sprite_hit_left);
	dir = DIRECTIONS.TOP;
}
else if (tilemap_get_at_pixel(obj_game_manager.collision_tilemap, x, bbox_top + move_y) && dir == DIRECTIONS.TOP)
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
	wait_timer = wait_time;
	set_hit_sprite(sprite_hit_top);
	dir = DIRECTIONS.RIGHT;
}
else if (tilemap_get_at_pixel(obj_game_manager.collision_tilemap, bbox_right + move_x, y) && dir == DIRECTIONS.RIGHT)
{
	var _pixel_check = _sub_pixel * sign(move_x);
	while (!place_meeting(x + _pixel_check, y, obj_game_manager.collision_tilemap))
		x += _pixel_check;
	move_x = 0;
	wait_timer = wait_time;
	set_hit_sprite(sprite_hit_right);
	dir = DIRECTIONS.BOTTOM;
}
else if (tilemap_get_at_pixel(obj_game_manager.collision_tilemap, x, bbox_bottom + move_y) && dir == DIRECTIONS.BOTTOM)
{
	var _pixel_check = _sub_pixel * sign(move_y);
	while (!place_meeting(x, y + _pixel_check, obj_game_manager.collision_tilemap))
		y += _pixel_check;
	move_y = 0;
	wait_timer = wait_time;
	set_hit_sprite(sprite_hit_bottom);
	dir = DIRECTIONS.LEFT;
}

x += move_x;
y += move_y;