/// @description init

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();


menu = [
	"Resume",
	"Restart from checkpoint",
	"Back to main menu",
];

menu_x = gui_width/2;
menu_y = gui_height/3*2+32;

menu_committed = -1;
menu_font = fnt_menu;
menu_item_h = font_get_size(fnt_menu);
menu_control = true;
sound_played = false;

menu_items = array_length(menu);
menu_cursor = -1;

scroll_status = 0;
scroll_top = 126;
scroll_bottom = 505;
scroll_h = sprite_get_height(spr_scrollInstruction_s);
scroll_w = sprite_get_width(spr_scrollInstruction_s);
scroll_speed = 10;
open_to = scroll_top;

scroll_x = menu_x-scroll_w/2;
scroll_y = gui_height/4-120;