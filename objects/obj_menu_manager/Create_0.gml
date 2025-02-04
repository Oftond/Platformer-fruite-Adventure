collision_tilemap = layer_tilemap_get_id("DecorationTiles");

if (!instance_exists(obj_player_defeat_transition))
	instance_create_layer(x, y, "Menegers", obj_player_defeat_transition);