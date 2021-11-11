/// @description menu setup

image_speed = 0;
image_index = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_x = gui_width/2;
menu_y = gui_height/2;

menu_font = fnt_menu;
menu_item_h = font_get_size(fnt_menu);
menu_committed = -1;
menu_control = true;
sound_played = false;

menu = [
	"Level 1",
	"Level 2",
	"Level 3",
	"Back"
]

menu_items = array_length(menu);
menu_cursor = -1;

