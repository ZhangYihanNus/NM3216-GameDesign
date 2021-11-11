/// @description check goto next room

if (triggered) {
	if (end_level) {
		scr_SlideTransition(TRANS_MODE.RESTART);
	} else if (next_room != noone) {
		global.BeanSize = 1;
		scr_SlideTransition(TRANS_MODE.GOTO, next_room);
	}
	if (global.from_checkpoint) global.from_checkpoint = false;
}
