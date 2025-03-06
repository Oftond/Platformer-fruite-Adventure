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

koef_scale = 6;

offset = 100;
space = (sprite_get_width(_01) * koef_scale) + offset;
col = global.NumLevels / 3;
row = global.NumLevels / 5;
x_pos = (room_width / 2) - ((col * space - offset) / 2);
y_pos = 320;

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
		if (_number > global.OpenLevels)
		{
			_level_obj.can_press = false;
			_level_obj.image_blend = c_grey;
		}
	}
}

instance_create_layer(x, y, "Managers", obj_shake);
instance_create_layer(1696, 960, "GUI", obj_back);

var _backgroundSprite = choose(spr_background_blue, spr_background_brown, spr_background_gray, spr_background_purple, spr_background_green, spr_background_pink, spr_background_yellow);
var _backgroundId = layer_background_get_id("Background");
layer_background_change(_backgroundId, _backgroundSprite);