if (instance_exists(obj_transition)) exit;
draw_self();
draw_set_font(fnt_main);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_text_ext_color(x, bbox_top + 40, text[global.Language], 60, sprite_width - 20, c_white, c_white, c_white, c_white, image_alpha + 0.3);