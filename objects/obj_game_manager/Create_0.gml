instance_create_depth(x, y, depth, obj_button_showFullscreenAds);

moneys = 0;

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
time_to_end_level = 10;

start_player_x = obj_player.x;
start_player_y = obj_player.y;

if (global.RespownX == -1 && global.RespownY == -1)
{
	global.RespownX = start_player_x;
	global.RespownY = start_player_y;
}

instance_create_layer(global.RespownX, global.RespownY, "Player", obj_player_appear);
if (instance_exists(obj_player))
	instance_destroy(obj_player);
instance_create_layer(1824, 96, "GUI", obj_button_settings);
instance_create_layer(x, y, "Managers", obj_shake);

collision_tilemap = layer_tilemap_get_id("CollisionTiles");
traps_layer_sand = layer_tilemap_get_id("TrapsLayerSand");
traps_layer_ice = layer_tilemap_get_id("TrapsLayerIce");

var _slash_pos = string_last_pos("_", room_get_name(room));
global.CurrentLevel = real(string_copy(room_get_name(room), _slash_pos + 1, string_length(room_get_name(room)) - _slash_pos));

if (global.FruitsCountInRoom[global.CurrentLevel - 1] == -1)
	global.FruitsCountInRoom[global.CurrentLevel - 1] = instance_number(obj_parent_fruit);

goto_next_level = function()
{
	alarm[0] = time_to_end_level;
}

global.SaveSystemManager.Save();