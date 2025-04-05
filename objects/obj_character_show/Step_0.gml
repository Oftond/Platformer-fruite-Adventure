if (x != current_x_pos)
{
	scroll_characters();
	if (number == 2)
		appear_effect();
	else
		disAppear_effect();
}

if (number == 2 && is_bought && !instance_exists(obj_accept_get_moneys_menu) && !instance_exists(obj_maxHealth))
{
	obj_button_play.can_press = true;
	obj_button_play.image_blend = c_white;
	obj_button_levels.can_press = true;
	obj_button_levels.image_blend = c_white;
	if (instance_exists(obj_button_buyCharacter))
		instance_destroy(obj_button_buyCharacter);
}
else if (number == 2 && !is_bought && !instance_exists(obj_accept_get_moneys_menu) && !instance_exists(obj_maxHealth))
{
	obj_button_play.can_press = false;
	obj_button_play.image_blend = c_grey;
	obj_button_levels.can_press = false;
	obj_button_levels.image_blend = c_grey;
	if (!instance_exists(obj_button_buyCharacter))
		instance_create_layer(960, 704, "GUI", obj_button_buyCharacter);
}