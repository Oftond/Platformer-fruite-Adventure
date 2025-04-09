event_inherited();

number_level = -1;
time_to_start_game = 60;

in_room_pos_x = x;
in_room_pos_y = y;

button_press = function()
{
	instance_create_layer(x, y, "GUI", obj_transition);
	alarm[0] = time_to_start_game;
}