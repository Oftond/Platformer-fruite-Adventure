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
	DESAPPEAR
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
global.Score = 0;
global.CurrentLevel = 0;
global.IsPause = false;
global.NumLevels = 10;
global.OpenLevels = 1;