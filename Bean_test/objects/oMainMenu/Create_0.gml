/// @description menu setup

image_speed = 0;
image_index = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_x = gui_width/2;
menu_y = gui_height/2-64;

menu_font = fnt_menu;
menu_item_h = font_get_size(fnt_menu);
menu_committed = -1;
menu_control = true;
sound_played = false;

menu = [
	"New Game",
	"Continue",
	"Select Level",
	"How to Play",
	"Credits",
	"Quit Game"
]

menu_items = array_length(menu);
menu_cursor = -1;


if (file_exists(SAVEFILE)) {
	have_save = true;
} else {
	have_save = false;	
}


prompt_size_max = 0.9;
prompt_size_min = 0.7;
prompt_speed = 50;
prompt_size = prompt_size_min;
prompt_grow = true;
