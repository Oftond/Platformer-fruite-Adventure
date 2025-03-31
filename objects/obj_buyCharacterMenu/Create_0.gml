text =
[
	"У вас слишком маленький баланс. Хотите посмотреть короткий видеоролик, чтобы получить персонажа бесплатно?",
	"Your balance is too small. Would you like to watch a reward video to get a character for free?"
];

if (instance_exists(obj_button_buyCharacter))
{
	obj_button_buyCharacter.image_blend = c_grey;
	obj_next.image_blend = c_grey;
	obj_previous.image_blend = c_grey;
	obj_button_buyHealth.image_blend = c_grey;
}