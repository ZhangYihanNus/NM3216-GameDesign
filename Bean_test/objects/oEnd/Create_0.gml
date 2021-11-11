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
	"Back to main menu"
]

menu_items = array_length(menu);
menu_cursor = -1;

