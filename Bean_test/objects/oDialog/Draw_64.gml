/// @description draw dialog box

if (activated) {
	
	draw_set_font(dialog_font);

	#region draw frame
	draw_set_alpha(1)
	draw_sprite(spr_dialogFrame1, 0, 0, gui_h-11);
	#endregion
	
	
	#region draw name
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var col;
	var name;
	var alp;
	var offset = 2;
	if (dialog_owner == 0) {
		col = $66B24D;
		name = "King Virus";
		alp = 1;
	} else {
		col = $00EEFF;
		name = "Bean";
		alp = 1;
	}
	draw_set_alpha(alp);
	draw_set_color(c_black)
	draw_text_ext_transformed(UI_MARGIN*5+offset, box_y+UI_MARGIN, name, 0, gui_w, name_size*1.2, name_size, 0);
	draw_text_ext_transformed(UI_MARGIN*5, box_y+UI_MARGIN+offset, name, 0, gui_w, name_size*1.2, name_size, 0);
	draw_text_ext_transformed(UI_MARGIN*5-offset, box_y+UI_MARGIN, name, 0, gui_w, name_size*1.2, name_size, 0);
	draw_text_ext_transformed(UI_MARGIN*5, box_y+UI_MARGIN-offset, name, 0, gui_w, name_size*1.2, name_size, 0);
	draw_set_color(col);
	draw_text_ext_transformed(UI_MARGIN*5, box_y+UI_MARGIN, name, 0, gui_w, name_size*1.2, name_size, 0);
	
	#endregion
	
	
	#region draw text
	draw_set_color($0E4384);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_transformed(UI_MARGIN*5, box_y+UI_MARGIN*3, 
		text_showing, 40, gui_w-UI_MARGIN*15, text_size*1.2, text_size, 0);
	
	#endregion
	
	
	#region draw prompt
	if (status == 2) {
		draw_set_color($0E4384);
		draw_set_alpha(0.6);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		var prompt = "Left click to continue...";
		draw_text_ext_transformed(gui_w-UI_MARGIN*5, gui_h-UI_MARGIN*2, 
			prompt, 40, gui_w-UI_MARGIN*12, prompt_size*1.2, prompt_size, 0);
	}
	#endregion
	



}

