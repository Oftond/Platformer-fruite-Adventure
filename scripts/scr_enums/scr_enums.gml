enum STATES
{
	IDLE,
	JUMP,
	DOUBLE_JUMP,
	FALL,
	WALK,
	WALL_JUMP,
	HIT,
	ATTACK,
	ANTICIPATION,
	CEILLING,
	APPEAR,
	DESAPPEAR,
	WALL_HIT,
}

enum DIRECTIONS
{
	LEFT,
	TOP,
	RIGHT,
	BOTTOM
}

enum LANGUAGES
{
	RUS,
	ENG
}

global.Language = LANGUAGES.ENG;
global.IsPause = false;

global.Score = 0;
global.CurrentLevel = 0;
global.NumLevels = 10;
global.OpenLevels = 1;

global.FruitsCountInRoom = array_create(global.NumLevels, 0);

global.RespownX = 0;
global.RespownY = 0;