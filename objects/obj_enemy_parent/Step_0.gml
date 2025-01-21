if (is_death)
{
	image_angle += 3;
	exit;
}

if (x < 0 || x > room_width + sprite_width)
	instance_destroy(self);

if (y < 0 || y > room_height + sprite_height)
	instance_destroy(self); 