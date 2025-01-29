if (!instance_exists(obj_player))
	exit;

if (number > obj_player.current_hp)
	instance_destroy(self);
	
if (number == instance_number(obj_player_heart) && number < obj_player.current_hp)
{
	for (var i = number; i < obj_player.current_hp; i++)
	{
		with (instance_create_layer(100 + (i * 70), 100, "GUI", obj_player.object_heart))
		{
			number = i + 1;
			image_index = other.image_index;
			image_speed = other.image_speed;
		}
	}
	obj_player_heart.alarm[0] = self.anim_frequency;
}