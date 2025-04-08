if (YaGames_getInitStatus())
{
	YaGames_GameReadyOn();
	room_goto_next();
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