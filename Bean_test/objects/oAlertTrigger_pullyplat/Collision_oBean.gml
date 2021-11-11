/// @description trigger alert
collision_obj = other.id;

if (global.BeanSize < 3) {
	if (repeatable || (!triggered || lasting)) {
		triggered = true;
		if (lasting) {
			this_time_triggered = true;
			scr_TextAlert(alert_text, alert_frames, other, id, print_speed, priority);
		} else if (!this_time_triggered) {
			this_time_triggered = true;
			scr_TextAlert(alert_text, alert_frames, other, id, print_speed, priority);
		}
	}
}
