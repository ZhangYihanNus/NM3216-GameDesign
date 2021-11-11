/// @description draw instructions

draw_sprite_part(spr_scrollInstruction, 0, 0, 0, scroll_w, open_to, scroll_x, scroll_y);
draw_sprite_part(spr_scrollInstruction, 0, 0, scroll_bottom, scroll_w, scroll_h-scroll_bottom, scroll_x, scroll_y+open_to);


/*
#region title
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
#endregion
	
	
	
#region instructions
draw_set_color(c_black);
draw_set_alpha(0.3);
draw_rectangle(x_text-700, 400, x_text+700, gui_height/2+200, false);

var instructions = 
	"Left click and drag ANYWHERE to jump,"+
	"\nPress 'S' to split or merge,"+
	"\nPress 'Space' to switch control between slimes,"+
	"\nPress 'D' to pull levers."
	

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var xx = x_text;
var yy = 450;
var sep = 70;
offset = 3;
text_scale = 1;
		
draw_set_color(c_black);
draw_text_ext_transformed(xx+offset, yy, instructions, sep, 1000, text_scale*1.2, text_scale, 0);
draw_text_ext_transformed(xx-offset, yy, instructions, sep, 1000, text_scale*1.2, text_scale, 0);
draw_text_ext_transformed(xx, yy+offset, instructions, sep, 1000, text_scale*1.2, text_scale, 0);
draw_text_ext_transformed(xx, yy-offset, instructions, sep, 1000, text_scale*1.2, text_scale, 0);
	
draw_set_color(c_white);
draw_text_ext_transformed(xx, yy, instructions, sep, 1000, text_scale*1.2, text_scale, 0);
#endregion

*/


#region back button
draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var i=0; i<menu_items; i++) {
	var text = menu[i];
	var offset = 3;
	var col = c_white;
	if (menu_cursor == i) {
		 var text_scale = 1.5;
		if (mouse_check_button(mb_left)) text_scale = 1.2;;
	} else {
		//var col = c_ltgray;
		 var text_scale = 1.2;
		
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
