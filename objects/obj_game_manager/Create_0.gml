start_player_x = obj_player.x;
start_player_y = obj_player.y;

if (instance_exists(obj_player))
	instance_destroy(obj_player);

collision_tilemap = layer_tilemap_get_id("CollisionTiles");
traps_layer_sand = layer_tilemap_get_id("TrapsLayerSand");
traps_layer_ice = layer_tilemap_get_id("TrapsLayerIce");

instance_create_layer(start_player_x, start_player_y, "Player", obj_player_appear);