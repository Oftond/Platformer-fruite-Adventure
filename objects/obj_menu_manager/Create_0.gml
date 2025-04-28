if (global.is_touch)
{
	layer_destroy("Borders");
	mobile_sittings_menu_and_levelsMenu_set();
}

global.CurrentHP = global.MaxHP;
global.RespownX = -1;
global.RespownY = -1;
global.RoomData = { };
global.IsWatchVideo = false;

text =
[
	"Ваш баланс",
	"Your balance"
];

text_level =
[
	"Уровень",
	"Level"
];

text_health =
[
	"купить сердце\nза",
	"buy a heart\nfor"
];

health_price = 150;
moneys_bonus = 50;

is_keyboard_control = false;
selected_index = 0;

text_maxHP =
[
	"МАКС",
	"MAX"
];

instance_create_layer(x, y, "Managers", obj_charactersShop_manager);

if (!global.is_touch)
{
	instance_create_layer(1632, 288, "GUI", obj_button_volume);
	instance_create_layer(736, 832, "GUI", obj_button_play);
	instance_create_layer(1184, 832, "GUI", obj_button_levels)
	instance_create_layer(672, 544, "GUI", obj_previous);
	instance_create_layer(1248, 544, "GUI", obj_next);
	instance_create_layer(342, 544, "GUI", obj_button_buyHealth);
}
else
{
	with (instance_create_layer(1184, 108, "GUI", obj_button_volume))
	{
		in_room_pos_x = 1504;
		in_room_pos_y = 288;
	}
	with (instance_create_layer(416, 652, "GUI", obj_button_play))
	{
		in_room_pos_x = 736;
		in_room_pos_y = 832;
	}
	with (instance_create_layer(864, 652, "GUI", obj_button_levels))
	{
		in_room_pos_x = 1184;
		in_room_pos_y = 832;
	}
	with (instance_create_layer(352, 364, "GUI", obj_previous))
	{
		in_room_pos_x = 672;
		in_room_pos_y = 544;
	}
	with (instance_create_layer(928, 364, "GUI", obj_next))
	{
		in_room_pos_x = 1248;
		in_room_pos_y = 544;
	}
	with (instance_create_layer(160, 364, "GUI", obj_button_buyHealth))
	{
		in_room_pos_x = 480;
		in_room_pos_y = 544;
	}
}

set_random_background();