if (global.IsPause) exit;
event_inherited();

switch (state)
{
	case STATES.IDLE:
		sprite_index = idle_sprites[global.ChooseCharacter];
		image_speed = 1;
	break;
	
	case STATES.JUMP:
		sprite_index = jump_sprites[global.ChooseCharacter];
		image_speed = 1;
	break;
	
	case STATES.DOUBLE_JUMP:
		sprite_index = doubleJump_sprites[global.ChooseCharacter];
		image_speed = 1;
		if (image_index == sprite_get_number(sprite_index) - 1)
			state = STATES.JUMP;
	break;
	
	case STATES.FALL:
		sprite_index = fall_sprites[global.ChooseCharacter];
		image_speed = 1;
	break;
	
	case STATES.WALK:
		sprite_index = run_sprites[global.ChooseCharacter];
		image_speed = 1;
		if (place_meeting(x, y + 1, obj_game_manager.traps_layer_sand))
			image_speed = image_speed * 0.65;
	break;
	
	case STATES.WALL_JUMP:
		sprite_index = wallJump_sprites[global.ChooseCharacter];
		image_speed = 1;
	break;
	
	case STATES.HIT:
		image_speed = 1;
		if (sprite_index != hit_sprites[global.ChooseCharacter])
		{
			image_index = 0;
			sprite_index = hit_sprites[global.ChooseCharacter];
		}
		if (image_index >= image_number - 1)
		{
			image_speed = 0;
		}
	break;
}