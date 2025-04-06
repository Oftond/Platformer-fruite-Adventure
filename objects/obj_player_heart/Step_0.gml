if (!instance_exists(obj_player) || global.IsPause)
	exit;

if (number > global.CurrentHP)
	instance_destroy(self);
	
if (number == instance_number(obj_player_heart) && number < global.CurrentHP)
{
	var _offxet_x = 100;
	var _max_in_row = 0;
	if (global.is_touch)
		_max_in_row = 4;
	else
		_max_in_row = 8;
	for (var i = number; i < global.CurrentHP; i++)
	{
		var _col = i mod _max_in_row;
		var _pos = _offxet_x + (_col * 70);
		with (instance_create_layer(_pos, 100, "GUI", obj_player.object_heart))
		{
			number = i + 1;
			image_index = other.image_index;
			image_speed = other.image_speed;
			if (number > _max_in_row) y += 80;
		}
	}
	with (obj_player_heart)
	{
		alarm[0] = self.anim_frequency;
	}
}