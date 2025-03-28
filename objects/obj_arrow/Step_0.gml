if (global.IsPause) exit;

if (destroy && !off)
{
	image_index = 0;
	sprite_index = spr_arrow_hit;
	off = true;
}

if (off)
{
	if (!visible)
		exit;
	if (image_index >= sprite_get_number(sprite_index) - 1)
	{
		visible = false;
		alarm[0] = 600;
		image_speed = 0;
	}
}

if (image_speed == -1)
{
	if (image_index >= sprite_get_number(sprite_index) - 1)
	{
		sprite_index = spr_arrow_idle;
		image_speed = 1;
	}
}