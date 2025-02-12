all_characters = 
[
	{name : "virtualGuy", sprite : spr_virtualGuy_idle, cost : 1145},
	{name : "ninjaFrog", sprite : spr_ninjaFrog_idle, cost : 0},
	{name : "pinkMan", sprite : spr_pinkMan_idle, cost : 345},
	{name : "maskDude", sprite : spr_maskDude_idle, cost : 675}
];

current_index = global.ChooseCharacter;

y_pos = 640;
x_pos_start = 800;
x_pos_right = 1280;
x_offset = 160;

show_next_character = function()
{
	current_index = (current_index + 1 + array_length(all_characters)) mod array_length(all_characters);
	global.ChooseCharacter = current_index;
	var _all_characters = instance_number(obj_character_show);
	for (var i = 0; i < _all_characters; i++)
	{
		var _instance = instance_find(obj_character_show, i);
		_instance.invokeNext();
	}
}

show_previous_character = function()
{
	current_index = (current_index - 1 + array_length(all_characters)) mod array_length(all_characters);
	global.ChooseCharacter = current_index;
	var _all_characters = instance_number(obj_character_show);
	for (var i = 0; i < _all_characters; i++)
	{
		var _instance = instance_find(obj_character_show, i);
		_instance.invokePrevious();
	}
}

var _firstCharacter = current_index;
for (var i = 0; i < array_length(all_characters); i++)
{
	var _x_pos = x_pos_start + (i * x_offset);
	var _character = instance_create_layer(_x_pos, y_pos, "GUI", obj_character_show);
	_character.manager = self;
	_character.sprite_index = all_characters[_firstCharacter].sprite;
	_character.number = i + 1;
	if (global.Score < all_characters[_firstCharacter].cost)
		_character.price = all_characters[_firstCharacter].cost;
	else
		_character.price = 0;
	if (i != 1)
		_character.hide();
	_firstCharacter = (_firstCharacter + 1 + array_length(all_characters)) mod array_length(all_characters);
}