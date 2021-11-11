/// @description draw pause menu

if (global.paused) {
	
	var text_scale_ui;
	
	
	#region dark background
	draw_set_color(c_black);
	draw_set_alpha(0.85);
	draw_rectangle(0, 0, gui_width, gui_height, false);
	#endregion
	
	#region pause title
	draw_set_font(fnt_menu);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	var title = "Game Paused"
	text_scale_ui = 1.7;
	
	draw_text_transformed(menu_x, gui_height/9-64, title, text_scale_ui*1.2, text_scale_ui, 0);
	#endregion
	
	
	
	#region instructions
	/*
	draw_set_font(fnt_alert);
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_rectangle(menu_x-600, gui_height/4-48, menu_x+600, gui_height/2+64, false);
	draw_set_color($00EEFF);
	draw_set_alpha(1);
	
	var instructions = 
		"Left click and drag ANYWHERE to jump,"+
		"\nPress 'S' to split or merge,"+
		"\nPress 'Space' to switch control between slimes,"+
		"\nPress 'D' to pull levers."
	text_scale_ui = 1.1;
	
	draw_text_ext_transformed(menu_x, gui_height/3-64, instructions, 60, 1000, text_scale_ui*1.2, text_scale_ui, 0);
	*/
	
	draw_sprite_part(spr_scrollInstruction_s, 0, 0, 0, scroll_w, open_to, scroll_x, scroll_y);
	draw_sprite_part(spr_scrollInstruction_s, 0, 0, scroll_bottom, scroll_w, scroll_h-scroll_bottom, scroll_x, scroll_y+open_to);

	#endregion
	
	#region pause menu
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(menu_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	for (var i=0; i<menu_items; i++) {
		var text = menu[i];
		if (menu_cursor == i) {
			text_scale_ui = 1.5;
			if (mouse_check_button(mb_left)) text_scale_ui = 1.2;;
		} else {
			text_scale_ui = 1;
		}
	
		var xx = menu_x;
		var yy = menu_y + (i*menu_item_h*2)
		draw_text_transformed(xx, yy, text, text_scale_ui*1.2, text_scale_ui, 0);
	
	}
	#endregion
	
}
