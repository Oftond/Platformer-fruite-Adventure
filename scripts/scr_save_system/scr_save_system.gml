function FileManager() constructor
{
	WriteToFile = function(_content, _fileName, _fileEnding = ".json")
	{
		var _file = $"{_fileName}{_fileEnding}";
		var _buffer = buffer_create(string_byte_length(_content) + 1, buffer_fixed, 1);
		buffer_write(_buffer, buffer_string, _content);
		buffer_save(_buffer, _file);
		buffer_delete(_buffer);
	}
	
	ReadFromFile = function(_fileName, _fileEnding = ".json")
	{
		var _file = $"{_fileName}{_fileEnding}";
		if (!file_exists(_file))
			return "";
		var _buffer = buffer_load(_file);
		var _content = buffer_read(_buffer, buffer_string);
		
		buffer_delete(_buffer);
		return _content;
	}
	
	DeleteFile = function(_fileName, _fileEnding = ".json")
	{
		var _file = $"{_fileName}{_fileEnding}";
		if (!file_exists(_file))
			return;
		file_delete(_file);
	}
}

function SaveSystem() constructor
{
	fileName = "FileName";
	
	Save = function()
	{ 
		var _file_manager = new FileManager();
		_file_manager.WriteToFile(GetData(), fileName);
	}
	
	Load = function()
	{
		var _file_manager = new FileManager();
		SetData(_file_manager.ReadFromFile(fileName)); 
	}
	
	Delete = function()
	{
		var _file_manager = new FileManager();
		_file_manager.DeleteFile(fileName)
	}
	
	GetData = function() { return "" }
	
	SetData = function(_data) { }
}

///Изменяемый класс, хранит в себе всю логику сохранений
///и загрузки файлов.
function GameManager() : SaveSystem() constructor
{
	fileName = "SaveFile_1";
	
	///Логика сохранения всех данных об игре
	GetData = function()
	{
		var _player_struct =
		{
			max_hp : global.MaxHP,
			choose_character : global.ChooseCharacter,
			current_level : global.CurrentLevel,
			open_levels : global.OpenLevels,
			player_score : global.Score,
			score_in_level : global.ScoreInLevel,
			is_on_valume : global.IsOnValume,
			friuts_count_in_room : global.FruitsCountInRoom,
			volume_music : global.ValumeMusic,
			volume_sound : global.ValumeSound,
		}
		
		return json_stringify(_player_struct);
	}
	
	///Логика загрузки всех данных об игре
	///@param _data Данные, полученные из файла
	SetData = function(_data)
	{
		if (_data == "") return;
		
		var _data_struct = json_parse(_data);
		global.MaxHP = _data_struct.max_hp;
		global.ChooseCharacter = _data_struct.choose_character;
		global.CurrentLevel = _data_struct.current_level;
		global.OpenLevels = _data_struct.open_levels;
		global.Score = _data_struct.player_score;
		global.ScoreInLevel = _data_struct.score_in_level;
		global.IsOnValume = _data_struct.is_on_valume;
		global.FruitsCountInRoom = _data_struct.friuts_count_in_room;
		global.ValumeMusic = _data_struct.volume_music;
		global.ValumeSound = _data_struct.volume_sound;
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
		playerScore : score
	}

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
	
	for (var i = 0; i < _room_struct.enemyNumber; i++)
	{
		var _enemy = instance_find(obj_enemy_parent, i);
		_room_struct.enemys[i] =
		{
			x_pos : _enemy.start_pos_x,
			y_pos : _enemy.start_pos_y,
			object : _enemy.object_index
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
	
	global.RoomData = _room_struct;
}

function LoadRoom()
{
	if (array_length(struct_get_names(global.RoomData)) == 0)
		return;
	
	if (instance_exists(obj_enemy_parent))
		instance_destroy(obj_enemy_parent)
		
	if (instance_exists(obj_parent_fruit))
		instance_destroy(obj_parent_fruit)
		
	if (instance_exists(obj_checkpoint))
		instance_destroy(obj_checkpoint)
		
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
	
	score = global.RoomData.playerScore;
}

global.SaveSystemManager = new GameManager();