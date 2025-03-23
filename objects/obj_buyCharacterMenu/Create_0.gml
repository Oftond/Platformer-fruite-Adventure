text =
[
	"У вас недостаточно монет. Хотите посмотреть короткий видеоролик, чтобы получить персонажа бесплатно?",
	"You don't have enough money. Do you want to watch a reward video to get a character for free?"
];

if (instance_exists(obj_button_buy))
{
	obj_button_buy.image_blend = c_grey;
	obj_next.image_blend = c_grey;
	obj_previous.image_blend = c_grey;
}