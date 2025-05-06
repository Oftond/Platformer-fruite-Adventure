function ReadFromFile(_file)
{
	var _buffer = buffer_load(_file);
	var _content = buffer_read(_buffer, buffer_string);
	
	buffer_delete(_buffer);
	return _content;
}

function SaveSystem() constructor
{
	Save = function()
	{
		if (score > 0 && instance_exists(obj_game_manager))
		{
			if (obj_game_manager.is_end_level)
				instance_create_depth(0, 0, 0, obj_leaderboards);
		}
		
		instance_create_depth(0, 0, 0, obj_button_setPlayerData);
	}
	
	Load = function()
	{
		instance_create_depth(0, 0, 0, obj_button_getPlayerAllData);
	}
}

function SaveRoom()
{
	var _room_struct =
	{
		fruitNumber : instance_number(obj_parent_fruit),
		fruits : array_create(instance_number(obj_parent_fruit), undefined),
		enemyNumber : instance_number(obj_enemy_parent),
		enemys : array_create(instance_number(obj_enemy_parent), undefined),
		checkPointNumber : instance_number(obj_checkpoint),
		checkPointFlagNumber : instance_number(obj_checkpoint_flag_idle) + 1,
		checkPoints : array_create(instance_number(obj_checkpoint), undefined),
		checkPointsFlag : array_create(instance_number(obj_checkpoint_flag_idle) + 1, undefined),
		playerScore : score,
		blocksNumber : instance_number(obj_block),
		blocks : array_create(instance_number(obj_block), undefined),
		playerMoneys : obj_game_manager.moneys,
		touch_fruit : global.TouchFruit
	};

	for (var i = 0; i < _room_struct.fruitNumber; i++)
	{
		var _fruit = instance_find(obj_parent_fruit, i);
		_room_struct.fruits[i] =
		{
			x_pos : _fruit.x,
			y_pos : _fruit.y,
			object : _fruit.object_index
		};
	}
	
	for (var i = 0; i < _room_struct.checkPointNumber; i++)
	{
		var _checkPoint = instance_find(obj_checkpoint, i);
		_room_struct.checkPoints[i] =
		{
			x_pos : _checkPoint.x,
			y_pos : _checkPoint.y,
			object : _checkPoint.object_index
		};
	}
	
	for (var i = 0; i < _room_struct.checkPointFlagNumber; i++)
	{
		var _checkPoint = instance_find(obj_checkpoint_flag_idle, i);
		if (_checkPoint != -4)
		{
			_room_struct.checkPointsFlag[i] =
			{
				x_pos : _checkPoint.x,
				y_pos : _checkPoint.y,
				object : _checkPoint.object_index
			};
		}
		else
			_room_struct.checkPointsFlag[i] =
			{
				x_pos : self.x,
				y_pos : self.y,
				object : obj_checkpoint_flag_idle
			};
	}
	
	for (var i = 0; i < _room_struct.blocksNumber; i++)
	{
		var _block = instance_find(obj_block, i);
		_room_struct.blocks[i] =
		{
			x_pos : _block.x,
			y_pos : _block.y,
		};
	}
	
	for (var i = 0; i < _room_struct.enemyNumber; i++)
	{
		var _enemy = instance_find(obj_enemy_parent, i);
		if (_enemy.is_death) continue;
		_room_struct.enemys[i] =
		{
			x_pos : _enemy.start_pos_x,
			y_pos : _enemy.start_pos_y,
			object : _enemy.object_index
		};
	}
	
	global.RoomData = _room_struct;
}

function LoadRoom()
{
	if (array_length(struct_get_names(global.RoomData)) == 0) return;
	
	if (instance_exists(obj_enemy_parent))
		instance_destroy(obj_enemy_parent)
		
	if (instance_exists(obj_parent_fruit))
		instance_destroy(obj_parent_fruit)
		
	if (instance_exists(obj_checkpoint))
		instance_destroy(obj_checkpoint)
		
	if (instance_exists(obj_block))
		instance_destroy(obj_block)
		
	for (var i = 0; i < global.RoomData.enemyNumber; i++)
	{
		instance_create_layer(global.RoomData.enemys[i].x_pos, global.RoomData.enemys[i].y_pos, "Enemys", global.RoomData.enemys[i].object)
	}

	for (var i = 0; i < global.RoomData.fruitNumber; i++)
	{
		instance_create_layer(global.RoomData.fruits[i].x_pos, global.RoomData.fruits[i].y_pos, "Collectiable", global.RoomData.fruits[i].object)
	}
	
	for (var i = 0; i < global.RoomData.checkPointNumber; i++)
	{
		instance_create_layer(global.RoomData.checkPoints[i].x_pos, global.RoomData.checkPoints[i].y_pos, "Environment", global.RoomData.checkPoints[i].object)
	}
	
	for (var i = 0; i < global.RoomData.checkPointFlagNumber; i++)
	{
		instance_create_layer(global.RoomData.checkPointsFlag[i].x_pos, global.RoomData.checkPointsFlag[i].y_pos, "Environment", global.RoomData.checkPointsFlag[i].object)
	}
	
	for (var i = 0; i < global.RoomData.blocksNumber; i++)
	{
		instance_create_layer(global.RoomData.blocks[i].x_pos, global.RoomData.blocks[i].y_pos, "Environment", obj_block);
	}
	
	score = global.RoomData.playerScore;
	obj_game_manager.moneys = global.RoomData.playerMoneys;
	global.TouchFruit = global.RoomData.touch_fruit;
}

global.SaveSystemManager = new SaveSystem();

function GetStringFromArray(_array)
{
	var _splitter = " ";
	var _result_string = "";
	
	for (var i = 0; i < array_length(_array); i++)
	{
		_result_string += string(_array[i]);
		if (i < array_length(_array) - 1)
			_result_string += _splitter;
	}
	
	return _result_string;
}

function GetArrayFromString(_string)
{
	var _splitter = " ";
	var _result_array = [];
	var _array = string_split(_string, _splitter);
	
	for (var i = 0; i < array_length(_array); i++)
	{
		_result_array[i] = real(_array[i]);
	}
	
	return _result_array;
}