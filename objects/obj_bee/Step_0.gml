if (is_death)
{
	image_angle += 3;
	exit;
}

if (shoot_timer > 0)
	shoot_timer--;

var _find_player = instance_nearest(x, y, obj_player);
var _distance_to_player = distance_attack + 1;
if (_find_player != noone)
	_distance_to_player = point_distance(x, y, _find_player.x, _find_player.y);

if (_distance_to_player <= distance_attack && state == STATES.IDLE && shoot_timer <= 0)
{
	state = STATES.ATTACK;
	shoot_timer = max_shoot_timer;
	is_shoot = false;
}

spd += move_spd;
x = xx + cos(spd) * r;
y = yy + sin(spd) *r;