/// @description Restart level
if (global.debug) {
	if (global.from_checkpoint) global.from_checkpoint = false;
	scr_SlideTransition(TRANS_MODE.RESTART);
}
