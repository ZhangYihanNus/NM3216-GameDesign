/// @description draw black bars
if (room == INIT_ROOM_NUM) {
	draw_set_color(c_black);
	draw_set_alpha(init_a);
	draw_rectangle(0, 0, w, h, false);
}
depth = -10
if (mode != TRANS_MODE.OFF) {
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(0, 0, w, percent * h_half, false);
	draw_rectangle(0, h, w, h - percent*h_half, false);
}

if (global.debug) {
	var text = "Debug Mode";
	var size = 1.5;
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_set_font(fnt_alert);
	draw_set_alpha(1);
	
	draw_text_transformed(w/2, UI_MARGIN, text, size*1.2, size, 0);
	
}

