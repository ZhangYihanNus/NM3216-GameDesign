/// @description draw instructions

#region pause title
draw_set_font(fnt_menu);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var title = "Credits";
var text_scale = 1.7;
var offset = 3;

var xx = menu_x;
var yy = title_y;
draw_set_color(c_black);
draw_text_transformed(xx+offset, yy, title, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx-offset, yy, title, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx, yy+offset, title, text_scale*1.2, text_scale, 0);
draw_text_transformed(xx, yy-offset, title, text_scale*1.2, text_scale, 0);
	
draw_set_color(c_white);
draw_text_transformed(xx, yy, title, text_scale*1.2, text_scale, 0);
#endregion


#region draw credit content

draw_sprite_part(spr_credits, 0, 0, credit_pos, credit_w, shown_h, menu_x-credit_w/2, credit_y);


#endregion

#region back button
draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var i=0; i<menu_items; i++) {
	var text = menu[i];
	var offset = 3;
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
