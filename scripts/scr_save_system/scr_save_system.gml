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
			player_max_hp : obj_player.max_hp,
			player_current_hp : obj_player.current_hp,
			player_x : obj_player.x,
			player_y : obj_player.y
		}
		
		return json_stringify(_player_struct);
	}
	
	///Логика загрузки всех данных об игре
	///@param _data Данные, полученные из файла
	SetData = function(_data)
	{
		if (_data == "")
		{
			instance_create_layer(352, 836, "Player", obj_temp);
			return;
		}
		var _player_struct = json_parse(_data);
		instance_destroy(obj_temp);
		instance_create_layer(_player_struct.player_x, _player_struct.player_y, "Player", obj_temp);
		obj_temp.max_hp = _player_struct.player_max_hp;
		obj_temp.current_hp = _player_struct.player_current_hp;
	}
}