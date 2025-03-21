event_inherited();

button_press = function()
{
	obj_button_play.delete_seq();
	obj_button_levels.delete_seq();
	instance_create_depth(0, 0, 0, obj_button_showRewardVideo);
}