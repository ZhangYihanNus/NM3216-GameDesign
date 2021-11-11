/// @description draw instructions


#region title
/*
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var title = "How to play"
var xx = x_text;
var yy = 200;
var text_scale = 1.8;
var offset = 5;
		
draw_set_color(c_black);
draw_text_transformed(xx+offset, yy, title, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx-offset, yy, title, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx, yy+offset, title, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx, yy-offset, title, text_scale*1.2, text_scale, 0);
	
draw_set_color(c_white);
draw_text_transformed(xx, yy, title, text_scale*1.2, text_scale, 0);
*/
#endregion

	
	
#region instructions

var congrats1 = "CONGRATULATIONS!";
var congrats2 = "You helped Bean escape safely!";
	

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var xx = x_text;
var yy = 350;
var offset = 3;
var text_scale = 3;
	
draw_set_color(c_black);
draw_text_transformed(xx+offset, yy, congrats1, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx-offset, yy, congrats1, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx, yy+offset, congrats1, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx, yy-offset, congrats1, text_scale*1.2, text_scale, 0);
draw_set_color(c_orange);
draw_text_transformed(xx, yy, congrats1, text_scale*1.2, text_scale, 0);
text_scale = 1.3;
yy += 200;
draw_set_color(c_black);
draw_text_transformed(xx+offset, yy, congrats2, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx-offset, yy, congrats2, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx, yy+offset, congrats2, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx, yy-offset, congrats2, text_scale*1.2, text_scale, 0);
draw_set_color(c_orange);
draw_text_transformed(xx, yy, congrats2, text_scale*1.2, text_scale, 0);

#endregion




#region back button
draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var i=0; i<menu_items; i++) {
	 var text = menu[i];
	 offset = 3;
	var col = c_white;
	if (menu_cursor == i) {
		 text_scale = 1.5;
		if (mouse_check_button(mb_left)) text_scale = 1.2;;
	} else {
		//var col = c_ltgray;
		 text_scale = 1.2;
		
	}
	
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
#endregion
