global.SaveSystemManager.Load();
global.CurrentHP = global.MaxHP;
global.RespownX = -1;
global.RespownY = -1;
global.RoomData = { };

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

is_keyboard_control = false;
selected_index = 0;

instance_create_layer(x, y, "Managers", obj_charactersShop_manager);
instance_create_layer(x, y, "Managers", obj_shake);

instance_create_layer(1664, 96, "GUI", obj_button_volume);
instance_create_layer(736, 832, "GUI", obj_button_play);
instance_create_layer(1184, 832, "GUI", obj_button_levels);
instance_create_layer(672, 544, "GUI", obj_previous);
instance_create_layer(1248, 544, "GUI", obj_next);

set_random_background();