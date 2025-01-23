is_end_level = false;

start_player_x = obj_player.x;
start_player_y = obj_player.y;

global.RespownX = start_player_x;
global.RespownY = start_player_y;

instance_create_layer(start_player_x, start_player_y, "Player", obj_player_appear);

if (instance_exists(obj_player))
	instance_destroy(obj_player);

collision_tilemap = layer_tilemap_get_id("CollisionTiles");
traps_layer_sand = layer_tilemap_get_id("TrapsLayerSand");
traps_layer_ice = layer_tilemap_get_id("TrapsLayerIce");

global.CurrentLevel = real(string_copy(room_get_name(room), string_length(room_get_name(room)), 1));

if (global.FruitsCountInRoom[global.CurrentLevel - 1] == 0)
	global.FruitsCountInRoom[global.CurrentLevel] = instance_number(obj_parent_fruit);