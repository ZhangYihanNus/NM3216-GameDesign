/// @description draw volume gui

var _x = camera_get_view_x(view_camera[0]);

if (control) {
	draw_set_color(c_ltgray);
	draw_rectangle(x_orig-x_limit-_x, y+5, x_orig-_x, y-5, false);
	draw_circle(x_orig-x_limit-_x, y, 4, false);
	draw_circle(x_orig-_x, y, 4, false);
	
	
	draw_set_font(fnt_menu);
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	var xx = x_orig - x_limit - 60-_x;
	var yy = y;
	var text_scale = 0.7;
	var offset = 2;
	
	if (music_sfx == 0) {
		var icon = spr_music;
	} else {
		var icon = spr_sndefx;
	}
		
	draw_sprite_ext(icon, 0, xx, yy, 1, 1, 0, c_white, 1);

	draw_sprite_ext(spr_volumeSlider, 0, x-_x, y, button_scale, button_scale, 0, c_white, 1);
}

