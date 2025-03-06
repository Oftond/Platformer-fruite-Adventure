text =
[
	"Требуется",
	"Need"
];

text2 =
[
	"Открыт",
	"Discovered"
];

manager = undefined;
number = -1;
current_x_pos = x;
price = 0;

hide = function()
{
	image_alpha = 0;
	image_xscale = 0;
	image_yscale = 0;
}

invokeNext = function()
{
	number--;
	current_x_pos -= manager.x_offset;
	if (number < 1)
	{
		x = manager.x_pos_right;
		current_x_pos = x;
		number = array_length(manager.all_characters);
	}
	else if (number > array_length(manager.all_characters))
	{
		x = manager.x_pos_start
		current_x_pos = x;
		number = 1;
	}
}

invokePrevious = function()
{
	number++;
	current_x_pos += manager.x_offset;
	if (number < 1)
	{
		x = manager.x_pos_right;
		current_x_pos = x;
		number = array_length(manager.all_characters);
	}
	else if (number > array_length(manager.all_characters))
	{
		x = manager.x_pos_start
		current_x_pos = x;
		number = 1;
	}
}

scroll_characters = function()
{
	if (x > current_x_pos)
	{
		x -= 20;
		if (x < current_x_pos)
			x = current_x_pos;
	}
	else
	{
		x += 20;
		if (x > current_x_pos)
			x = current_x_pos;
	}
}

appear_effect = function()
{
	if (image_alpha < 1)
		image_alpha += 0.2;
	if (image_xscale < 1 && image_yscale < 1)
	{
		image_xscale += 0.2;
		image_yscale += 0.2;
	}
}

disAppear_effect = function()
{
	if (image_alpha > 0)
		image_alpha -= 0.2;
	if (image_xscale > 0 && image_yscale > 0)
	{
		image_xscale -= 0.2;
		image_yscale -= 0.2;
	}
}