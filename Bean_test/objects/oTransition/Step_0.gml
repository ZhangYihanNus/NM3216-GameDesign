/// @description progress transition
if (room == INIT_ROOM_NUM) {
	if (!init_finished && mouse_check_button_pressed(mb_left)) {
		room_goto(HOME_ROOM_NUM)
		mode = TRANS_MODE.INTRO;
		init_finished = true;
		show_debug_message("init transit");
	}
}

if (room == INIT_ROOM_NUM) {
	if (curr_delay >= init_delay2) {
		if (init_a >= 0.95) {
			if (!init_finished) {
				room_goto(HOME_ROOM_NUM)
				mode = TRANS_MODE.INTRO;
				init_finished = true;
				show_debug_message("init transit")
			}
		} else {
			init_a += max((1-init_a)/init_speed2, 0.03);
		}
	} else if (curr_delay >= init_delay) {
		if (init_a <= 0.01) {
			// do nothing
		} else {
			init_a -= min(init_a/init_speed, 0.01);
		}
	}
	curr_delay += 1;
} 


if (keyboard_check(ord("T"))&&keyboard_check(ord("Y"))&&keyboard_check_pressed(ord("U"))) {
		
	global.debug = !global.debug;
	
}

var percentTarget = 1.2		// defines black bar movements

if (mode != TRANS_MODE.OFF) {
	if (global.controlable) global.controlable = false;
	if (instance_exists(oPlatform)) audio_stop_sound(snd_pullyWheel);
	
	if (mode == TRANS_MODE.INTRO) {
		percent = max(0, percent - max((percent/10), 0.005));
	} else {
		percent = min(percentTarget, percent + max(((percentTarget-percent)/10), 0.005));
	}
	

	if (percent == percentTarget) or (percent == 0) {
			
		if (global.paused) scr_Pause();
		switch (mode) {
			case TRANS_MODE.INTRO: {
				mode = TRANS_MODE.OFF;
				global.controlable = true;
				break;	
			}
			case TRANS_MODE.NEXT: {
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;	
			}
			case TRANS_MODE.GOTO: {
				show_debug_message("goto transition")
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;	
			}
			case TRANS_MODE.RESTART: {
				game_restart();
				audio_group_load(bgm_music);
				audio_group_load(sound_effects);
				break;	
			}
			case TRANS_MODE.CHECKPOINT: {
				// game restart
				//game_restart();
				//room_goto(room);
				
				global.from_checkpoint = true;
				global.show_checkpoint_msg = false;
				global.haveKey = false;
				global.split = false;
				
				// read saved room & checkpoint
				if (file_exists(SAVEFILE)) {
					// create new save
					var file;
					file = file_text_open_read(SAVEFILE);
					global.checkpoint_x = file_text_read_real(file);
					global.checkpoint_y = file_text_read_real(file);
					file_text_readln(file);
					global.checkpoint_room = file_text_read_real(file);
					file_text_readln(file);
					global.BeanHealth = file_text_read_real(file);
					if (global.BeanHealth != global.BeanHealthMax) global.BeanHealth = global.BeanHealthMax;
					global.BeanSize = file_text_read_real(file);
					file_text_close(file);
				}
				
				// go to checkpoint
				room_goto(global.checkpoint_room);
				mode = TRANS_MODE.INTRO;
				
				break;
			}
		}
	}
}

