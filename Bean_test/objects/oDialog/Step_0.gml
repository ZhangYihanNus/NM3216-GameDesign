/// @description process dialogs


#region process single dialog
if (activated) {
	global.controlable = false;
	dialog_owner = dialogs[dialog_item][0];
	dialog_msg = dialogs[dialog_item][1];
	status = 1;
	if (end_letter == 1) {
		// stop current talk
		if (bean_talk != noone) {
			audio_stop_sound(bean_talk);
			bean_talk = noone;
		}
		if (boss_talk != noone) {
			audio_stop_sound(boss_talk);
			boss_talk = noone;
		}
		
		// play sound
		if (dialog_owner == 0) {
			boss_talk = audio_play_sound(snd_bossTalk, 5, true);
		} else {
			bean_talk = audio_play_sound(snd_beanTalk, 5, true);
		}
		
	}
	if (end_letter == string_length(dialog_msg)+prompt_delay) {
		if (bean_talk != noone) {
			audio_stop_sound(bean_talk);
			bean_talk = noone;
		}
		if (boss_talk != noone) {
			audio_stop_sound(boss_talk);
			boss_talk = noone;
		}
		status = 2;
	}
} else {
	global.controlable = true;
	status = 0;
}
#endregion

if (mouse_check_button_pressed(mb_left) && activated
	&& oPauseButton.status != 1 && !global.paused) {
	show_debug_message("\nleft clicked")
	// stop current talk
	if (bean_talk != noone) {
		audio_stop_sound(bean_talk);
		bean_talk = noone;
	}
	if (boss_talk != noone) {
		audio_stop_sound(boss_talk);
		boss_talk = noone;
	}
	
	if (dialog_item = array_length(dialogs)-1) {
		activated = false;
	} else {
		dialog_item++;
		end_letter = 0;
	}
}




