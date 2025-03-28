if (global.IsPause) exit;

if (image_index >= image_number - 1)
	instance_destroy(self);
image_index++;
alarm[1] = 30;