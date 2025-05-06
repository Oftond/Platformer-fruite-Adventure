if (global.is_touch)
	mobile_settings_levels_game();
	
if (global.CurrentHP <= 0)
{
	global.CurrentHP = global.MaxHP;
}

depth = 900;

driving_main = MP3_Driving_Main;
etherial_main = MP3_Ethereal_Main;
heroic_main = MP3_Heroic_Main;
hight_tempo_main = MP3_High_Tempo_Main;

sequence_mobile_buttons = undefined;
if (global.is_touch && sequence_mobile_buttons == undefined)
	sequence_mobile_buttons = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_mobile_control);

var _slash_pos = string_last_pos("_", room_get_name(room));
global.CurrentLevel = real(string_copy(room_get_name(room), _slash_pos + 1, string_length(room_get_name(room)) - _slash_pos));

is_checkpoint = false;
moneys = 0;
sequence_loseMenu = undefined;

endAlpha = false;
isAlpha = false;
alpha_text = 0;
alphaTime = 0;
text =
[
	"Уровень",
	"Level"
];

is_end_level = false;

start_player_x = obj_player.x;
start_player_y = obj_player.y;

temp_player_respown_X = -1;
temp_player_respown_y = -1;

if (global.RespownX == -1 && global.RespownY == -1)
{
	global.RespownX = start_player_x;
	global.RespownY = start_player_y;
}
else if (global.RespownX != start_player_x && global.RespownY != start_player_y)
{
	is_checkpoint = true;
	temp_player_respown_X = global.RespownX;
	temp_player_respown_y = global.RespownY;
}

instance_create_layer(global.RespownX, global.RespownY, "Player", obj_player_appear);
if (instance_exists(obj_player))
	instance_destroy(obj_player);

instance_create_layer(camera_get_view_width(view_camera[0]) - 96, 96, "GUI", obj_button_settings);
instance_create_layer(x, y, "Managers", obj_shake);

secret_walls = layer_tilemap_get_id("SecretWall");
collision_tilemap = layer_tilemap_get_id("CollisionTiles");
traps_layer_sand = layer_tilemap_get_id("TrapsLayerSand");
traps_layer_ice = layer_tilemap_get_id("TrapsLayerIce");

if (global.CurrentLevel > 0 && global.CurrentLevel < 6)
	SetMusicPlay(etherial_main);
else if (global.CurrentLevel > 5 && global.CurrentLevel < 11)
	SetMusicPlay(hight_tempo_main);
else if (global.CurrentLevel > 10 && global.CurrentLevel < global.NumLevels)
	SetMusicPlay(heroic_main);
else
	SetMusicPlay(driving_main);