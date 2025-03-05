event_inherited();

switch (state)
{
	case STATES.IDLE:
		if (sprite_index != spr_turtle_idle)
		{
			image_index = 0;
			sprite_index = spr_turtle_idle;
		}
		image_speed = 1;
		wait_timer++;
		if (wait_timer > wait_time)
			state = STATES.ATTACK;
	break;
	
	case STATES.ATTACK:
		if (!instance_exists(obj_turtle_spikes))
		{
			object_spikes = instance_create_depth(x, y, depth, obj_turtle_spikes);
			object_spikes.image_index = image_index;
		}
		image_speed = 1;
		if (sprite_index != sprite_attack_start && !attack_start)
		{
			sprite_index = sprite_attack_start;
			image_index = 0;
			attack_start = true;
			wait_timer = 0;
		}
		else if (sprite_index == sprite_attack_start && attack_start)
		{
			if (image_index >= image_number - 1)
			{
				image_index = 0;
				sprite_index = sprite_attack;
				wait_timer = wait_time;
			}
		}
		else if (wait_timer <= 0 && sprite_index == sprite_attack && !attack_end)
		{
			attack_end = true;
			image_index = 0;
			sprite_index = sprite_attack_end;
		}
		else if (sprite_index == sprite_attack_end && attack_end)
		{
			if (instance_exists(object_spikes))
				instance_destroy(object_spikes);
			if (image_index >= image_number - 1)
			{
				state = STATES.IDLE;
				wait_timer = 0;
				attack_start = false;
				attack_end = false;
			}
		}
		if (wait_timer > 0)
			wait_timer--;
	break;
	
	case STATES.HIT:
		sprite_index = sprite_hit;
		if (image_index >= sprite_get_number(sprite_index) - 1)
		{
			image_speed = 0;
			if (!is_death)
				state = STATES.IDLE;
		}
	break;
}