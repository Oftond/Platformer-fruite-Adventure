global.FruitsCountInRoom[global.CurrentLevel - 1] = instance_number(obj_parent_fruit);
if (global.ScoreInLevel[global.CurrentLevel - 1] > global.FruitsCountInRoom[global.CurrentLevel - 1])
	global.ScoreInLevel[global.CurrentLevel - 1] = global.FruitsCountInRoom[global.CurrentLevel - 1];
global.TouchFruit = undefined;
global.HeartsParts = undefined;
LoadRoom();