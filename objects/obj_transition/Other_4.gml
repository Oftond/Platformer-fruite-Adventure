transition_layer = layer_create(-10000);

transition_filter = fx_create("_filter_pixelate");

layer_set_fx(transition_layer, transition_filter);

fx_set_parameter(transition_filter, "g_CellSize", cellSize);

alarm[1] = 1;