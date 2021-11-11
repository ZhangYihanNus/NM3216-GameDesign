/// @description init

gui_height = display_get_gui_height();
gui_width = display_get_gui_width();

x_text = gui_width/2;

menu_x = gui_width/2;
menu_y = gui_height/4*3+100;

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

scroll_status = 0;
scroll_top = 126;
scroll_bottom = 712;
scroll_h = sprite_get_height(spr_scrollInstruction);
scroll_w = sprite_get_width(spr_scrollInstruction);
scroll_speed = 10;
open_to = scroll_top;

scroll_x = menu_x-scroll_w/2;
scroll_y = 100;

