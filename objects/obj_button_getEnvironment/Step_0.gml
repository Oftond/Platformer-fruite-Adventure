if (done == true)
{
	if (lang == "ru" || lang == "bb" || lang == "kk" || lang == "uk" || lang == "uz")
	{
		global.Language = LANGUAGES.RUS;
	}
	else
	{
		global.Language = LANGUAGES.ENG;
	}
	instance_destroy();
}