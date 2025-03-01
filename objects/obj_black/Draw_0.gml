draw_self();
draw_set_font(fnt_big);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_ext_transformed((camera_get_view_x(view_camera[0])) + global.CameraWidth / 2, camera_get_view_y(view_camera[0]) + 200, $"{text[global.Language]}: {global.CurrentLevel}", 100, 400, 1, 1, image_alpha);