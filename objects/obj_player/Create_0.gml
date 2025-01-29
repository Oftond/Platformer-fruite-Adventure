event_inherited();
object_heart = obj_player_heart;
move_wall_spd = 6;
move_locked_max_time = 10;
move_locked_time = 0;
on_wall = 0;
on_arrow = false;
global.RespownX = x;
global.RespownY = y;
mask_index = spr_player_maskCollide;

heal = function(_value)
{
	current_hp += _value;
	if (current_hp > max_hp)
		current_hp = max_hp;
}

instance_create_layer(x, y, "Menegers", obj_camera);

for (var i = 0; i < current_hp; i++)
{
	with (instance_create_layer(100 + (i * 70), 100, "GUI", object_heart))
	{
		number = i + 1;
	}
}