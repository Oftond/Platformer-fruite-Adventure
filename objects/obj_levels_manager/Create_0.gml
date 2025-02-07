levels_icon =
[
	
];

x_pos = 448;
y_pos = 320;

for (var i = 0; i < global.OpenLevels + 1; i++)
{
	var _x_pos = x_pos + (i * 70);
	var _y_pos = y_pos;
	var _level_obj = instance_create_layer(_x_pos, _y_pos, "Levels", obj_level);
	_level_obj.number_level = i + 1;
}