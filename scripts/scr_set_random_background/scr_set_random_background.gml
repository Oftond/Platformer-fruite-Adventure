function set_random_background()
{
	var _backgroundSprite = choose(spr_background_blue, spr_background_brown, spr_background_gray, spr_background_purple, spr_background_green, spr_background_pink, spr_background_yellow);
	var _backgroundId = layer_background_get_id("Background");
	layer_background_change(_backgroundId, _backgroundSprite);
}