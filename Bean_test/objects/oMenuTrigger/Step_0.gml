/// @description detect mouse select
if (instance_exists(target_menu)) {
	if (position_meeting(mouse_x, mouse_y, id) && target_menu.menu_control) {
		if (target_menu.menu_cursor != item_index) {
			if (room == LVL1_ROOM_NUM || room == LVL2_ROOM_NUM || room == LVL3_ROOM_NUM) {
				if (global.paused) audio_play_sound(snd_menu, 5, false);
			} else {
				audio_play_sound(snd_menu, 5, false);
			}
			target_menu.menu_cursor = item_index;
		}
	}
	if (!position_meeting(mouse_x, mouse_y, oMenuTrigger)) {
		target_menu.menu_cursor = -1;	
	}
}

if (shift_with_camera) {
	//persistent = true;
	x = camera_get_view_x(view_camera[0]) + x_orig;
}

