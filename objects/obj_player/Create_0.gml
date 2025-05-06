if (global.CurrentHP <= 0)
{
	global.CurrentHP = global.MaxHP;
}

if (instance_exists(obj_player_appear)) exit;

text_score =
[
	"счет",
	"score"
];

sound_of_lose = MP3_Hopeful_Lose_Sting;
sound_of_pain = OGG_Player_Pain2;

event_inherited();

part_dust = spr_dust_part;
part_ice = spr_ice_part;
part_sand = spr_sand_part;
cooldown_parts = 0;
max_cooldown_time = 10;

is_ripple_fruit = false;

can_double_jump = global.OpenLevels > 2;
can_wall_jump = global.OpenLevels > 5;

max_jumps = can_double_jump ? 2 : 1;
current_jumps = 0;

idle_sprites =
[
	spr_ninjaFrog_idle,
	spr_pinkMan_idle,
	spr_maskDude_idle,
	spr_virtualGuy_idle
];
hit_sprites =
[
	spr_ninjaFrog_hit,
	spr_pinkMan_hit,
	spr_maskDude_hit,
	spr_virtualGuy_hit
];
wallJump_sprites =
[
	spr_ninjaFrog_wallJump,
	spr_pinkMan_walljump,
	spr_maskDude_wallJump,
	spr_virtualGuy_walljump
];
fall_sprites =
[
	spr_ninjaFrog_fall,
	spr_pinkMan_fall,
	spr_maskDude_fall,
	spr_virtualGuy_fall
];
jump_sprites =
[
	spr_ninjaFrog_jump,
	spr_pinkMan_jump,
	spr_maskDude_jump,
	spr_virtualGuy_jump
];
run_sprites =
[
	spr_ninjaFrog_run,
	spr_pinkMan_run,
	spr_maskDude_run,
	spr_virtualGuy_run
];
doubleJump_sprites =
[
	spr_ninjaFrog_doubleJump,
	spr_pinkMan_doubleJump,
	spr_maskDude_doubleJump,
	spr_virtualGuy_doubleJump
];

game_over = false;

max_hp = global.MaxHP;
current_hp = global.CurrentHP;

object_heart = obj_player_heart;
move_wall_spd = 6;
move_locked_max_time = 10;
move_locked_time = 0;
on_wall = 0;
on_ice = false;
on_arrow = false;

ice_speed_multiplier = 1.2;
inertia = 0;
deceleration = 0.2;
turn_deceleration = 0.3;
min_turn_speed = 0.1;

jump_buffer = 0;
jump_buffer_time = 10;

max_x_speed = 10;
max_y_speed = 35;

global.RespownX = x;
global.RespownY = y;
mask_index = spr_player_maskCollide;

get_damage = function(_damage)
{
	SetSoundPlay(sound_of_pain);
	current_hp -= _damage;
	update_globalHp();
	if (!game_over && current_hp <= 0)
	{
		game_over = true;
		if (!obj_game_manager.is_checkpoint) alarm[1] = 80;
		global.RoomData = { };
	}
}

heal = function(_value)
{
	current_hp += _value;
	if (current_hp > max_hp)
		current_hp = max_hp;
	update_globalHp();
}

check_collision_enemy = function()
{
	if (global.IsPause) return;
	
	with (instance_place(x, y + move_y, obj_enemy_parent))
	{
		if (name == "rino")
		{
			if (sprite_index == sprite_hit_wall)
			{
				if (!other.is_graunded)
				{
					if ((other.bbox_bottom - other.move_y) < (bbox_top - move_y))
					{
						other.move_y = 0;
						other.move_y -= other.jump_spd + 5;
						other.current_jumps = 1;
					}
				}
			
				return;
			}
		}
		if (other.is_death || (name == "turtle" && state == STATES.ATTACK) || (name == "ghost" && (state == STATES.DESAPPEAR || state == STATES.APPEAR)) || name == "skull" || is_death && other.flashing > 0 || state == STATES.HIT || other.is_knockback)
			return;
	
		if (!other.is_graunded)
		{
			if ((other.bbox_bottom - other.move_y) < (bbox_top - move_y))
			{
				get_damage(other.damage);
				other.move_y = 0;
				other.move_y -= other.jump_spd + 5;
				other.current_jumps = 1;
				return;
			}
		}
		
		var _x_sign = sign(other.x - x) == 0 ? image_xscale : sign(other.x - x);

		other.move_y = 0;
		other.move_y -= other.jump_spd + 5;
		other.current_jumps = 1;
		other.move_x = _x_sign * 10;
		other.get_damage(damage);
		other.flashing = max_flashing;
		other.is_knockback = true;
		other.state = STATES.HIT;
		other.image_index = 0;
		other.alarm[0] = time_to_knockback;
	}
}

update_globalHp = function()
{
	global.MaxHP = max_hp;
	global.CurrentHP = current_hp;
}

check_squeezing = function(_move_x, _move_y)
{
	return place_meeting(x + _move_x, y + _move_y, obj_game_manager.collision_tilemap) || place_meeting(x + _move_x, y + _move_y, obj_game_manager.traps_layer_sand) || place_meeting(x + _move_x, y + _move_y, obj_game_manager.traps_layer_ice);
}

instance_create_layer(x, y, "Managers", obj_camera);

var _offxet_x = 100;
var _max_in_row = 0;
if (global.is_touch)
	_max_in_row = 4;
else
	_max_in_row = 8;

for (var i = 0; i < current_hp; i++)
{
	var _col = i mod _max_in_row;
	var _pos = _offxet_x + (_col * 70);
	var _obj = instance_create_layer(_pos, i + 1 > _max_in_row ? 180 : 100, "GUI", object_heart);
	_obj.number = i + 1;
}