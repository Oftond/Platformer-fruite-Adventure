event_inherited();
time_to_start_game = 60;
acceptWindow_sequence = undefined;

button_press = function()
{
	instance_create_layer(x, y, "GUI", obj_transition);
	alarm[0] = time_to_start_game;
}

delete_seq = function()
{
	if (acceptWindow_sequence == undefined) return;
	layer_sequence_destroy(acceptWindow_sequence);
	acceptWindow_sequence = undefined;
}