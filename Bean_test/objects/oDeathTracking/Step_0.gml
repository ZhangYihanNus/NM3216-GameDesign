/// @description Bean dies
if ((oBean.y < 0 || oBean.y >= camera_get_view_height(view_camera[0])+64)
	|| (instance_exists(oSplit) && (oSplit.y < 0 || oSplit.y >= camera_get_view_height(view_camera[0])+64))) {
	show_debug_message("out of world")
	global.BeanHealth = 0;
}



if (global.BeanHealth == 0) {
	if (global.controlable) global.controlable = false;
	
	
	var obj = global.focus;
	
	if (deathAnimation == -1) {
		deathAnimation = DEATHANIMATIONFRAMES;
		obj.vsp = DEATHVSP;
		obj.hsp = 0;
		audio_play_sound(snd_die, 7, false);
	} else if (deathAnimation == 0) {
		global.focus = global.BeanID;
		global.split = false;
		scr_SlideTransition(TRANS_MODE.CHECKPOINT);
	} else {
		deathAnimation -= 1;
	}
} else {
	deathAnimation = -1;
}
