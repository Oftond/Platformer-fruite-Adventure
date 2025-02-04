cellSize -= 2;

fx_set_parameter(transition_filter, "g_CellSize", cellSize);

if (cellSize <= 2)
{
	instance_destroy();
	
	layer_destroy(transition_layer);
}
else
{
	alarm[1] = 1;
}