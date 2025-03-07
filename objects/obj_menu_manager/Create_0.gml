global.SaveSystemManager.Load();

global.CurrentHP = global.MaxHP;
global.RespownX = -1;
global.RespownY = -1;
global.RoomData = { };

instance_create_layer(x, y, "Managers", obj_charactersShop_manager);
instance_create_layer(x, y, "Managers", obj_shake);

set_random_background();