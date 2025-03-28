if (global.IsPause) exit;

event_inherited();
switch (state)
{
	case STATES.IDLE:
		if (current_hp < max_hp)
		{
			sprite_index = sprite_idle_ground;
			image_speed = 1;
		}
		else
		{
			sprite_index = sprite_idle_fly;
			image_speed = 1;
		}
	break;
	
	case STATES.WALK:
		if (sprite_index != sprite_run)
		{
			sprite_index = sprite_run;
			image_index = 0;
			image_speed = 1;
		}
	break;
	
	case STATES.HIT:
		if (sprite_index != sprite_hit)
		{
			sprite_index = sprite_hit;
			image_index = 0;
			if (current_hp == max_hp - 1)
			{
				with (instance_create_layer(x, bbox_top, "Enemys", obj_radish_leafs))
				{
					enemy = other;
					sprite_leaf_right = other.sprite_leafs_right;
					sprite_leaf_left = other.sprite_leafs_left;
				}
			}
		}
		image_speed = 1;
		if (image_index >= image_number - 1)
		{
			
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
}