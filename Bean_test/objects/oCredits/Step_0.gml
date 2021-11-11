/// @description ?

if (delay != initial_delay) {
	delay += 1;
} else {
	credit_pos += credit_speed;
	if (credit_pos >= credit_h) {
		credit_pos = 0;
		delay = 0;
	}
}


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
	show_debug_message("menu selected item: " + string(menu_committed))
	switch (menu_committed) {
		case 0: {
			scr_SlideTransition(TRANS_MODE.GOTO, HOME_ROOM_NUM);
			menu_control = true;
			menu_committed = -1;
			break;
		}
	}
}
