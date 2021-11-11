/// @description variables and mode

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;

enum TRANS_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	CHECKPOINT,
	NOTHING,
	INTRO
}
mode = TRANS_MODE.OFF;
percent = 1;
target = room;

curr_delay = 0;
init_delay = 30;
init_delay2 = 180;
init_speed = 60;
init_speed2 = 20;
init_a = 1;
init_finished = false;


