event_inherited();
time_to_start_game = 60;
index = 0;

button_press = function()
{
	instance_create_layer(x, y, "GUI", obj_transition);
	alarm[0] = time_to_start_game;
	instance_create_depth(0, 0, depth, obj_button_showFullscreenAds);
}