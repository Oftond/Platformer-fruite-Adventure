text =
[
	$"У вас слишком маленький баланс. Хотите посмотреть короткий видеоролик и увеличить баланс на {obj_menu_manager.moneys_bonus}?",
	$"Your balance is too small. Would you like to watch a short video and increase your balance by {obj_menu_manager.moneys_bonus}?"
];

depth = -999;

with (obj_button_buyCharacter)
{
	image_blend = c_grey;
}
obj_next.image_blend = c_grey;
obj_previous.image_blend = c_grey;
obj_button_buyHealth.image_blend = c_grey;
obj_button_volume.image_blend = c_grey;
obj_button_play.image_blend = c_grey;
obj_button_levels.image_blend = c_grey;
obj_button_play.can_press = false;
obj_button_levels.can_press = false;