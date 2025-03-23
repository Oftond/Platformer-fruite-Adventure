global.ChooseCharacter = 0;

global.CurrentLevel = 1;
global.NumLevels = 15;
global.OpenLevels = 1;

global.MaxHP = 3;
global.CurrentHP = global.MaxHP;
global.Score = 0;
global.ScoreInLevel = array_create(global.NumLevels, 0);

global.Moneys = 0;

global.IsOnValume = true;

global.Language = LANGUAGES.RUS;
global.IsPause = false;

global.FruitsCountInRoom = array_create(global.NumLevels, -1);

global.RespownX = -1;
global.RespownY = -1;

global.RoomData = { };

global.BoughtMaskDude = false;
global.BoughtPinkMan = false;
global.BoughtVirtualGuy = false;

global.IsHelpsForMove = false;
global.IsHelpsForJump = false;
global.IsHelpsForWallJump = false;
global.IsHelpsForDoubleJump = false;
global.IsHelpsForCrushBlock = false;

global.FruitsCollected = { };