if (YaGames_getInitStatus() && !set_up)
{
	YaGames_GameReadyOn();
	instance_create_depth(0, 0, 0, obj_playerInit);
	set_up = true;
}

if (os_browser != browser_not_a_browser)
{
	if (browser_width != bw || browser_height != bh)
	{
		bw = browser_width;
		bh = browser_height;
		window_set_size(bw, bh);
		window_center();
	}
}

//room_goto_next();