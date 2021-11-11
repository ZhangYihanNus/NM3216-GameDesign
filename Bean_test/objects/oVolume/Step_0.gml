/// @description toggle volume
if (global.BGM == noone && audio_group_is_loaded(bgm_music)) {
	global.BGM = audio_play_sound(snd_bgm_happy, 10, true);
}

x_orig = camera_get_view_x(view_camera[0]) + x_base + x_limit;

// update volume with current
if (music_sfx == 0) {
	x = camera_get_view_x(view_camera[0]) + x_base + (global.music_volume) * x_limit;
} else {
	x = camera_get_view_x(view_camera[0]) + x_base + (global.sfx_volume) * x_limit;
}

// set controlable
if (room_get_name(room) == room_get_name(HomeMenu) || global.paused) {
	control = true;
} else {
	control = false;
}

// slider
if (control && oTransition.mode == TRANS_MODE.OFF) {
	if (mouse_check_button(mb_left)) {
		if (position_meeting(mouse_x, mouse_y, id) && !dragging && mouse_check_button_pressed(mb_left)) {
			dragging = true;
		}
	}
	if (mouse_check_button_released(mb_left)) {
		if (dragging) dragging = false;
	}
	
	if (dragging) {
		if (mouse_x < x_orig-x_limit) {
			x = x_orig-x_limit;
		} else if (mouse_x > x_orig) {
			x = x_orig;
		} else {
			x = mouse_x;
		}
	}
	
	if (!dragging && position_meeting(mouse_x, mouse_y, id)) button_scale = 1.1;
	else if (dragging) button_scale = 0.8;
	else button_scale = 1;
	
	
}

// adjust volume
var volume = (x_limit - x_orig + x) / x_limit;
if (music_sfx == 0) {
	global.music_volume = volume;
	audio_group_set_gain(bgm_music, global.music_volume*global.music_base, 0);
} else {
	global.sfx_volume = volume;
	audio_group_set_gain(sound_effects, global.sfx_volume*global.sfx_base, 0);
}







