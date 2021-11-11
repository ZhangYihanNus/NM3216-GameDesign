/// @description pause game

if (keyboard_check_pressed(vk_escape) && oTransition.mode == TRANS_MODE.OFF && global.BeanHealth>0) {
	scr_Pause();
}

