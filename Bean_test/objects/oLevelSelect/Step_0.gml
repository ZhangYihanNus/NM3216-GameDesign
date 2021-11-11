/// @description menu control

// selecting
if (menu_control) {
	if (mouse_check_button_pressed(mb_left) && menu_cursor!=-1) {
		if (!sound_played) {
			audio_play_sound(snd_menu, 5, false);
			sound_played = true;
		}
		menu_committed = menu_cursor;
		menu_control = false;
	}
}

// activate
if (menu_committed != -1) {
	switch (menu_committed) {
		case 0: {
			scr_SlideTransition(TRANS_MODE.GOTO, LVL1_ROOM_NUM);	
			menu_control = true;
			menu_committed = -1;
			break;
		}
		case 1: {
			scr_SlideTransition(TRANS_MODE.GOTO, LVL2_ROOM_NUM);
			menu_control = true;
			menu_committed = -1;
			break;
		}
		case 2: {
			scr_SlideTransition(TRANS_MODE.GOTO, LVL3_ROOM_NUM);
			menu_control = true;
			menu_committed = -1;		
			break;
		}
		case 3: {
			scr_SlideTransition(TRANS_MODE.GOTO, HOME_ROOM_NUM);
			menu_control = true;
			menu_committed = -1;
			break;
		}
	}
}

