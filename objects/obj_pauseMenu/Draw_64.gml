if (instance_exists(obj_transition)) exit;

draw_self();
draw_set_font(fnt_big);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_ext_transformed(global.CameraWidth / 2, 200, $"{text[global.Language]}: {global.CurrentLevel}", 100, 400, 1, 1, 0);