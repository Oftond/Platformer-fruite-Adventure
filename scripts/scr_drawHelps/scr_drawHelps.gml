function draw_helps_move()
{
	static size_move = 0;
	draw_sprite_ext(spr_keyboard_keys_move, 1, 576, 860, size_move, size_move, 0, c_white, 1);
	draw_sprite_ext(spr_keyboard_keys_move, 2, 416, 860, size_move, size_move, 0, c_white, 1);
	if (size_move < 1)
	{
		size_move += 0.1;
	}
	else
		global.IsHelpsForMove = true;
}

function draw_helps_jump()
{
	if (!instance_exists(obj_player)) return;
	static size_jump = 0;
	if (obj_player.x < 800 && size_jump == 0) return;
	draw_sprite_ext(spr_keyboard_keys_move, 0, 896, 860, size_jump, size_jump, 0, c_white, 1);
	if (size_jump < 1)
	{
		size_jump += 0.1;
	}
	else
		global.IsHelpsForJump = true;
}