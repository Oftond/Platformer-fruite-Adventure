if (global.is_touch)
	mobile_sittings_menu_and_levelsMenu_set();

SetMusicPlay(MP3_Welcome_Home_Main);
global.IsWatchVideo = false;

text =
[
	"ОБЩИЙ СЧЕТ",
	"TOTAL SCORE"
]

levels_icon =
[
	_01,
	_02,
	_03,
	_04,
	_05,
	_06,
	_07,
	_08,
	_09,
	_10,
	_11,
	_12,
	_13,
	_14,
	_50,
	_15,
	_16,
	_17,
	_18,
	_19,
	_20,
	_21,
	_22,
	_23,
	_24,
	_25
];

is_keyboard_control = false;
selected_index = 0;

koef_scale = 6;

offset = 100;
space = (sprite_get_width(_01) * koef_scale) + offset;
col = global.NumLevels / 3;
row = global.NumLevels / 5;
x_pos = 0;
y_pos = 0;
if (!global.is_touch)
{
	x_pos = ((room_width / 2) + offset / 2) - ((col * space - offset) / 2);
	y_pos = 320;
}
else
{
	x_pos = ((room_width / 2) + offset / 2) - ((col * space - offset) / 2) - offset * 3;
	y_pos = 320 - space;
}

for (var i = 0; i < row; i++)
{
	for (var j = 0; j < col; j++)
	{
		var _x_pos = x_pos + (j * space);
		var _y_pos = y_pos + (i * space);
		var _level_obj = instance_create_layer(_x_pos, _y_pos, "Levels", obj_level);
		var _number = (i * col + j) + 1;
		_level_obj.number_level = _number;
		_level_obj.sprite_index = levels_icon[_number - 1];
		_level_obj.koef_scale = koef_scale;
		_level_obj.index = (i * col + j);
		if (_number > global.OpenLevels)
		{
			_level_obj.can_press = false;
			_level_obj.image_blend = c_grey;
		}
	}
}

instance_create_layer(x, y, "Managers", obj_shake);

if (!global.is_touch)
{
	with (instance_create_layer(1696, 960, "GUI", obj_back))
	{
		index = instance_number(obj_level);
	}
}
else
{
	with (instance_create_layer(1184, 640, "GUI", obj_back))
	{
		index = instance_number(obj_level);
	}
}

set_random_background();