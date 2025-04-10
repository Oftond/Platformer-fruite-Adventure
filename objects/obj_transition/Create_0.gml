room_to_go = undefined;
current_room = room;

transition_layer = layer_create(-10000);

transition_filter = fx_create("_filter_pixelate");

layer_set_fx(transition_layer, transition_filter);

cellSize = 1;

fx_set_parameter(transition_filter, "g_CellSize", cellSize);

alarm[0] = 1;

if (!global.IsWatchVideo)
	instance_create_depth(0, 0, depth, obj_button_showFullscreenAds);
else if (global.IsWatchVideo)
	global.IsWatchVideo = false;