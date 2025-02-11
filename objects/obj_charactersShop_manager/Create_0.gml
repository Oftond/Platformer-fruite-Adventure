all_characters = 
[
	{name : "virtualGuy", sprite : spr_virtualGuy_idle, cost : 1000},
	{name : "ninjaFrog", sprite : spr_ninjaFrog_idle, cost : 0},
	{name : "pinkMan", sprite : spr_pinkMan_idle, cost : 250},
	{name : "maskDude", sprite : spr_maskDude_idle, cost : 587}
];

all_characters_objects = [];

current_index = global.ChooseCharacter;

y_pos = 640;
x_pos_start = 800;
x_pos_right = 1280;
x_offset = 160;

show_next_character = function()
{
	current_index = (current_index + 1 + array_length(all_characters)) mod array_length(all_characters);
	global.ChooseCharacter = current_index;
	array_foreach(all_characters_objects, update_objCharacters_next);
}

show_previous_character = function()
{
	current_index = (current_index - 1 + array_length(all_characters)) mod array_length(all_characters);
	global.ChooseCharacter = current_index;
	array_foreach(all_characters_objects, update_objCharacters_previous);
}

update_objCharacters_next = function(_element)
{
	_element.invokeNext();
}

update_objCharacters_previous = function(_element)
{
	_element.invokePrevious();
}

var _firstCharacter = current_index;
for (var i = 0; i < array_length(all_characters); i++)
{
	_firstCharacter = (_firstCharacter + 1 + array_length(all_characters)) mod array_length(all_characters);
	var _x_pos = x_pos_start + (i * x_offset);
	var _character = instance_create_layer(_x_pos, y_pos, "GUI", obj_character_show);
	_character.manager = self;
	_character.sprite_index = all_characters[_firstCharacter].sprite;
	_character.number = _firstCharacter + 1;
	if (i != 1)
		_character.hide();
	array_push(all_characters_objects, _character);
}