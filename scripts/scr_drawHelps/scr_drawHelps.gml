function draw_helps_move()
{
	if (global.IsHelpsFirst) return;
	
	static size_move = 0;
	var _text =
	[
		"двигаться",
		"move"
	];
	
	draw_sprite_ext(spr_keyboard_moveKey_right, 0, 576, 860, size_move, size_move, 0, c_white, 0.85);
	draw_sprite_ext(spr_keyboard_moveKey_left, 0, 416, 860, size_move, size_move, 0, c_white, 0.85);
	draw_set_font(fnt_main);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text_transformed_color(496, 860 + sprite_get_height(spr_keyboard_moveKey_right) + 8, _text[global.Language], size_move, size_move, 0, c_ltgray, c_ltgray, c_ltgray, c_ltgray, 0.85);
	if (size_move < 1)
	{
		size_move += 0.1;
	}
}

function draw_helps_jump()
{
	if (!instance_exists(obj_player) || global.IsHelpsFirst) return;
	var _text =
	[
		"прыгни на кубок, чтобы перейти к следующему уровню",
		"jump on the cup to advance to the next level"
	];
	draw_sprite_ext(spr_ninjaFrog_fall, 0, 9120, 500, 1, 1, 0, c_white, 0.85);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text_ext_transformed_color(9120, 550 - sprite_get_height(spr_ninjaFrog_fall), _text[global.Language], 70, 550, 1, 1, 0, c_white, c_white, c_white, c_white, 0.95);
	static size_jump = 0;
	_text =
	[
		"прыжок",
		"jump"
	];
	if (obj_player.x < 730 && size_jump == 0) return;
	draw_sprite_ext(spr_keyboard_moveKey_up, 0, 896, 860, size_jump, size_jump, 0, c_white, 0.85);
	draw_set_font(fnt_main);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text_transformed_color(896, 860 + sprite_get_height(spr_keyboard_moveKey_up) + 8, _text[global.Language], size_jump, size_jump, 0, c_ltgray, c_ltgray, c_ltgray, c_ltgray, 0.85);
	if (size_jump < 1)
	{
		size_jump += 0.1;
	}
}

function draw_helps_enemyHit()
{
	if (!instance_exists(obj_player) || global.IsHelpsFirst) return;
	static size_enemyHit = 0;
	var _text =
	[
		"прыгай на врага, чтобы нанести ему урон",
		"jump on the enemy to inflict damage on him"
	];
	if (obj_player.x < 1248 && size_enemyHit == 0) return;
	
	draw_sprite_ext(spr_mushroom_idle, 0, 2050, 560, size_enemyHit, size_enemyHit, 0, c_white, 0.85);
	draw_sprite_ext(spr_ninjaFrog_fall, 0, 2050, 570 - sprite_get_height(spr_ninjaFrog_jump), -size_enemyHit, size_enemyHit, 0, c_white, 0.85);
	draw_set_font(fnt_main);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_center);
	draw_text_ext_transformed_color(1634, 500 + sprite_get_height(spr_mushroom_hit) + 8, _text[global.Language], 70, 800, size_enemyHit, size_enemyHit, 0, c_white, c_white, c_white, c_white, 0.95);
	if (size_enemyHit < 1)
	{
		size_enemyHit += 0.1;
	}
}

function draw_helps_doubleJump()
{
	if (!instance_exists(obj_player) || global.IsHelpsSecond) return;
	
	static size_doubleJump = 0;
	var _text =
	[
		"нажми еще раз в воздухе, чтобы подпрыгнуть еще выше",
		"tap again in the air to jump even higher"
	];
	if (obj_player.x < 1610 && obj_player.y > 1056 && size_doubleJump == 0) return;
	draw_sprite_ext(spr_keyboard_moveKey_up, 0, 1632, 700, size_doubleJump, size_doubleJump, 0, c_white, 0.7);
	draw_set_font(fnt_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text_ext_transformed_color(1632, 700 + sprite_get_height(spr_keyboard_moveKey_up) - 32, _text[global.Language], 40, 600, size_doubleJump, size_doubleJump, 0, c_white, c_white, c_white, c_white, 0.7);
	if (size_doubleJump < 1)
	{
		size_doubleJump += 0.1;
	}
}

function draw_helps_crushBlocks()
{
	if (global.IsHelpsSecond) return;
	
	var _text =
	[
		"ударь блоки головой, чтобы их сломать",
		"hit the blocks with your head to break them"
	];
	
	draw_sprite_ext(spr_block_idle, 0, 3072, 1216, 1, 1, 0, c_white, 0.7);
	draw_set_font(fnt_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text_ext_transformed_color(3072, 1216 + sprite_get_height(spr_block_idle) - 48, _text[global.Language], 40, 600, 1, 1, 0, c_white, c_white, c_white, c_white, 0.7);
}

function draw_helps_wallJump()
{
	if (global.IsHelpsThird) return;
	
	var _text =
	[
		"прислонись к стене, когда будешь падать, чтобы зацепиться за стену и отпрыгнуть от нее",
		"lean against the wall as you fall to grab onto the wall and jump away from it."
	];
	
	draw_sprite_ext(spr_ninjaFrog_wallJump, 0, 4736, 1664, 1, 1, 0, c_white, 0.7);
	draw_set_font(fnt_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text_ext_transformed_color(4736, 1664 + sprite_get_height(spr_ninjaFrog_wallJump) - 48, _text[global.Language], 40, 600, 1, 1, 0, c_white, c_white, c_white, c_white, 0.7);
}