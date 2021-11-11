/// @description init

gui_height = display_get_gui_height();
gui_width = display_get_gui_width();

x_text = gui_width/2;

menu_x = gui_width/2;
menu_y = 1056;
title_y = 100;

menu_font = fnt_menu;
menu_item_h = font_get_size(fnt_menu);
menu_committed = -1;
menu_control = true;
sound_played = false;

menu = [
	"Back"
]

menu_items = array_length(menu);
menu_cursor = -1;

credit_pos = 0;
credit_h = sprite_get_height(spr_credits);
credit_w = sprite_get_width(spr_credits);
credit_speed = 1;
shown_h = 750;
credit_y = 250;
initial_delay = 120;
delay = 0;

