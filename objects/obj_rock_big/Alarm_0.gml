with (instance_create_layer(x + 10, y, "Enemys", obj_rock_middle))
{
	while(place_meeting(x, y, obj_game_manager.collision_tilemap)) x--;
	//while(!place_meeting(x, y + 1, obj_game_manager.collision_tilemap)) x--;
}
with (instance_create_layer(x - 10, y, "Enemys", obj_rock_middle))
{
	while(place_meeting(x, y, obj_game_manager.collision_tilemap)) x++;
	//while(!place_meeting(x, y + 1, obj_game_manager.collision_tilemap)) x++;
}
instance_destroy(self);