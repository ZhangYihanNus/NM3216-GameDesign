/// @description draw menu



draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var i=0; i<menu_items; i++) {
	var text = menu[i];
	var offset = 3;
	var col = c_white;
	//if (i == 2) {
	//	col = c_ltgray;
	//	var text_scale = 1;
	//} else 
	if (menu_cursor == i) {
		var text_scale = 1.5;
		if (mouse_check_button(mb_left)) text_scale = 1.2;;
	} else {
		//var col = c_ltgray;
		var text_scale = 1;
		
	}
	#region Continuable
	
	#endregion
	
	var xx = menu_x;
	var yy = menu_y + (i*menu_item_h*2)
	draw_set_color(c_black);
	draw_text_transformed(xx+offset, yy, text, text_scale*1.2, text_scale, 0);
	draw_text_transformed(xx-offset, yy, text, text_scale*1.2, text_scale, 0);
	draw_text_transformed(xx, yy+offset, text, text_scale*1.2, text_scale, 0);
	draw_text_transformed(xx, yy-offset, text, text_scale*1.2, text_scale, 0);
	
	draw_set_color(col);
	draw_text_transformed(xx, yy, text, text_scale*1.2, text_scale, 0);
	
}



