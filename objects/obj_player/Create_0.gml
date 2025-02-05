event_inherited();

game_over = false;

max_hp = global.MaxHP;
current_hp = global.CurrentHP;

object_heart = obj_player_heart;
move_wall_spd = 6;
move_locked_max_time = 10;
move_locked_time = 0;
on_wall = 0;
on_arrow = false;
global.RespownX = x;
global.RespownY = y;
mask_index = spr_player_maskCollide;

get_damage = function(_damage)
{
	current_hp -= _damage;
	update_globalHp();
	if (!game_over && current_hp <= 0)
	{
		game_over = true;
		alarm[1] = 60;
	}
}

heal = function(_value)
{
	current_hp += _value;
	if (current_hp > max_hp)
		current_hp = max_hp;
	update_globalHp();
}

//check_collision_enemy = function()
//{
//	with (instance_place(x, y, obj_enemy_parent))
//	{
//		if (other.is_death || (name == "turtle" && state == STATES.ATTACK) || (name == "ghost" && (state == STATES.DESAPPEAR || state == STATES.APPEAR)) || name == "skull" || is_death && other.flashing > 0 || state == STATES.HIT || other.is_knockback)
//		{
//			return;
//		}
	
//		if (!other.is_graunded)
//		{
//			if ((other.bbox_bottom - other.move_y) < (bbox_top - move_y))
//			{
//				if (other.state != STATES.HIT)
//					current_hp -= other.damage;
//				other.move_y = 0;
//				other.move_y -= other.jump_spd + 5;
//				other.current_jumps = 1;
//				if (state != STATES.HIT)
//					image_index = 0;
//				state = STATES.HIT;
//				return;
//			}
//		}
	
//		var _x_sign = sign(other.x - x) == 0 ? image_xscale : sign(other.x - x);

//		other.move_y = 0;
//		other.move_y -= other.jump_spd + 5;
//		other.current_jumps = 1;
//		other.move_x = _x_sign * 10;
//		other.get_damage(other.damage);
//		other.flashing = max_flashing;
//		other.is_knockback = true;
//		other.state = STATES.HIT;
//		other.image_index = 0;
//		other.alarm[0] = time_to_knockback;
//	}
//}

update_globalHp = function()
{
	global.MaxHP = max_hp;
	global.CurrentHP = current_hp;
}

instance_create_layer(x, y, "Menegers", obj_camera);

for (var i = 0; i < current_hp; i++)
{
	with (instance_create_layer(100 + (i * 70), 100, "GUI", object_heart))
	{
		number = i + 1;
	}
}