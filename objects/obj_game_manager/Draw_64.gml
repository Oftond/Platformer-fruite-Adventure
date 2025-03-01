if (endAlpha)
	exit;
draw_set_font(fnt_big);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed_color(global.CameraWidth / 2, 100, $"{text[global.Language]}: {global.CurrentLevel}", 1, 1, 0, c_white, c_white, c_white, c_white, alpha_text);

if (!isAlpha)
	alpha_text += 0.02;
else
	if (alphaTime < 80)
	{
		alphaTime++;
	}
	if (!endAlpha && alphaTime >= 80)
	{
		alpha_text -= 0.02;
		if (alpha_text <= 0)
		{
			endAlpha = true;
		}
	}
		
if (alpha_text >= 1 && !isAlpha)
	isAlpha = true;