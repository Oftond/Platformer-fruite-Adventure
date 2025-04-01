global.SaveSystemManager.Load();
global.CurrentHP = global.MaxHP;
global.RespownX = -1;
global.RespownY = -1;
global.RoomData = { };

SetMusicPlay(MP3_Welcome_Home_Main);

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

health_price = 100;

is_keyboard_control = false;
selected_index = 0;

instance_create_layer(x, y, "Managers", obj_charactersShop_manager);
instance_create_layer(x, y, "Managers", obj_shake);

instance_create_layer(1664, 96, "GUI", obj_button_volume);
instance_create_layer(736, 832, "GUI", obj_button_play);
instance_create_layer(1184, 832, "GUI", obj_button_levels);
instance_create_layer(672, 544, "GUI", obj_previous);
instance_create_layer(1248, 544, "GUI", obj_next);
instance_create_layer(342, 544, "GUI", obj_button_buyHealth);

set_random_background();