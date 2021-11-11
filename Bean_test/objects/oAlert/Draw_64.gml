/// @description draw alert



if (!display_finish) {
	
	draw_set_color(c_black);
	draw_set_alpha(background_alpha);
	draw_rectangle(rec1_x, rec1_y, rec2_x, rec2_y, false);
	
	
	draw_set_alpha(1);
	draw_set_font(fnt_alert);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text_ext_transformed_color(
		text_x, text_y, 
		text_showing, 
		text_sep, 
		(rec_w - 2*text_padding_x)/text_xscale, 
		text_xscale, text_yscale, 0,
		text_color, text_color, text_color, text_color, 
		text_alpha
		);
	
}
