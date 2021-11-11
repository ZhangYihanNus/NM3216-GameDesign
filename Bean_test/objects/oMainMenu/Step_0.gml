/// @description menu control
if (prompt_grow) {
	if (prompt_size < prompt_size_max-0.05) {
		prompt_size += (prompt_size_max-prompt_size)/prompt_speed;
	} else {
		prompt_grow = false;
	}
} else {
	if (prompt_size > prompt_size_min+0.05) {
		prompt_size += (prompt_size_min-prompt_size)/prompt_speed;
	} else {
		prompt_grow = true;
	}
}

// selecting
if (menu_control) {
	if (mouse_check_button_pressed(mb_left) && menu_cursor!=-1) {
		
		if (have_save || menu_cursor != 1) {
			if (!sound_played) {
				audio_play_sound(snd_menu, 5, false);
				sound_played = true;
			}
			menu_committed = menu_cursor;
			menu_control = false;
		}
	}
}

// activate
if (menu_committed != -1) {
	show_debug_message("\nmenu selected item: " + string(menu_committed))
	switch (menu_committed) {
		case 0: {
			scr_SlideTransition(TRANS_MODE.GOTO, LVL1_ROOM_NUM);
			menu_control = true;
			menu_committed = -1;
			break;
		}
		case 1: {
			// load game
			if (have_save) {
				scr_SlideTransition(TRANS_MODE.CHECKPOINT);	
				menu_control = true;
				menu_committed = -1;
			}
			break;
		}
		case 2: {
			// select level
			menu_committed = -1;
			scr_SlideTransition(TRANS_MODE.GOTO, LEVEL_ROOM_NUM);	
			menu_control = true;
			break;
		}
		case 3: {
			menu_committed = -1;
			scr_SlideTransition(TRANS_MODE.GOTO, INSTRUCTIONS_ROOM_NUM);	
			menu_control = true;
			break;
		}
		case 4: {
			scr_SlideTransition(TRANS_MODE.GOTO, CREDIT_ROOM_NUM);
			menu_committed = -1;	
			menu_control = true;
			break;
		}
		case 5: {
			// quit
			menu_committed = -1;
			menu_control = true;
			game_end();	
			break;
		}
	}
}

