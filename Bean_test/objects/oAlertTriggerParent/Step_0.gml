/// @description set collision finish
if repeatable lasting = true;


if (place_meeting(x, y, global.focus)) {

	collision_obj = global.focus;

	if (repeatable || !triggered || (!repeatable && triggered && lasting && this_time_triggered)) {
		
		
		if (!triggered) triggered = true;
		if (lasting) {
			this_time_triggered = true;
			scr_TextAlert(alert_text, alert_frames, collision_obj, id, print_speed, priority);
		} else if (!this_time_triggered) {
			this_time_triggered = true;
			scr_TextAlert(alert_text, alert_frames, collision_obj, id, print_speed, priority);
		}
	}
} else {
	if (this_time_triggered) this_time_triggered = false;
}
