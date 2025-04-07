global.MobileButtonLeft = false;
global.MobileButtonRight = false;
global.MobileButtonUp = false;

global.MaxValumeMusic = 0.5;
global.MaxValumeSound = 0.15;

global.ValumeMusic = global.MaxValumeMusic;
global.ValumeSound = global.MaxValumeSound;

global.CurrentPlayingMusic = noone;
global.CurrentPlayingSound = noone;

global.ChooseCharacter = 0;

global.CurrentLevel = 1;
global.NumLevels = 15;
global.OpenLevels = 1;

global.MaxHP = 3;
global.CurrentHP = global.MaxHP;
global.TotalMaxHP = 8;
global.Score = 0;
global.ScoreInLevel = array_create(global.NumLevels, 0);

global.Moneys = 0;

global.IsOnValume = true;

global.Language = LANGUAGES.ENG;
global.IsPause = false;

global.FruitsCountInRoom = array_create(global.NumLevels, -1);

global.RespownX = -1;
global.RespownY = -1;

global.TouchFruit = undefined;
global.RoomData = { };

global.BoughtMaskDude = false;
global.BoughtPinkMan = false;
global.BoughtVirtualGuy = false;

global.IsHelpsFirst = false;
global.IsHelpsSecond = false;
global.IsHelpsThird = false;

global.FruitsCollected = { };

global.Keyboard = ds_map_create();
global.Mobile = ds_map_create();

global.IsMovedCursor = false;

global.HeartsParts = undefined;

global.IsWatchVideo = false;