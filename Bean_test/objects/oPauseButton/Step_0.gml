/// @description check click

x = camera_get_view_x(view_camera[0]) + button_x;
y = camera_get_view_y(view_camera[0]) + button_y;

if (!global.paused) {
	if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)) {
		status = 2;
		
	}
	if (status == 2 && mouse_check_button_released(mb_left)) {
		scr_Pause();
		status = 0;
	}
	if (status != 2 && !mouse_check_button(mb_left)) {
		if (position_meeting(mouse_x, mouse_y, id)) {
			status = 1;
		} else {
			status = 0;
		}
	}
}
//show_debug_message(status)
