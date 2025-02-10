all_characters = 
[
	{name : "virtualGuy", sprite : spr_virtualGuy_idle, cost : 1000},
	{name : "ninjaFrog", sprite : spr_ninjaFrog_idle, cost : 0},
	{name : "pinkMan", sprite : spr_pinkMan_idle, cost : 250},
	{name : "maskDude", sprite : spr_maskDude_idle, cost : 587}
];

all_characters_objects = [];

current_index = 0;
//next_character_index = (current_index + 1 + array_length(all_characters)) mod array_length(all_characters);
//previous_character_index = (current_index - 1 + array_length(all_characters)) mod array_length(all_characters);
//current_character = all_characters[current_index];

y_pos = 640;
x_pos_start = 800;
x_offset = 160;

show_next_character = function()
{
	current_index = (current_index + 1 + array_length(all_characters)) mod array_length(all_characters);
	//next_character_index = (next_character_index + 1 + array_length(all_characters)) mod array_length(all_characters);
	//previous_character_index = (previous_character_index + 1 + array_length(all_characters)) mod array_length(all_characters);
	//current_character = all_characters[current_character_index];
	array_foreach(all_characters_objects, update_objCharacters);
}

show_previous_character = function()
{
	current_index = (current_index - 1 + array_length(all_characters)) mod array_length(all_characters);
	//next_character_index = (next_character_index - 1 + array_length(all_characters)) mod array_length(all_characters);
	//previous_character_index = (previous_character_index - 1 + array_length(all_characters)) mod array_length(all_characters);
	//current_character = all_characters[current_character_index];
	array_foreach(all_characters_objects, update_objCharacters);
}

update_objCharacters = function(_element)
{
	_element.invoke();
}

for (var i = 0; i < array_length(all_characters); i++)
{
	var _x_pos = x_pos_start + (i * x_offset);
	var _character = instance_create_layer(_x_pos, y_pos, "GUI", obj_character_show);
	_character.manager = self;
	_character.sprite_index = all_characters[i].sprite;
	_character.number = i + 1;
	array_push(all_characters_objects, _character);
}