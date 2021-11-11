/// @description menu control

if (global.paused) {
	if (scroll_status==0) {
		scroll_status = 1;
	}
	if (open_to == scroll_bottom && scroll_status == 1) {
		scroll_status = 2;
	}
	if (scroll_status == 1) {
		open_to += (scroll_bottom - open_to) / scroll_speed;
	}
} else {
	scroll_status = 0;
	open_to = scroll_top;
}

// selecting
if (menu_control && global.paused) {
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
			scr_Pause();
			menu_control = true;
			menu_committed = -1;
			break;
		}
		case 1: {
			scr_SlideTransition(TRANS_MODE.CHECKPOINT);	
			menu_control = true;
			menu_committed = -1;
			break;
		}
		case 2: {
			// main menu
			scr_SlideTransition(TRANS_MODE.GOTO, HOME_ROOM_NUM);
			menu_control = true;
			menu_committed = -1;
			break;
		}
	}
}

