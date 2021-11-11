/// @description trigger alert
collision_obj = other.id;

if (collision_obj.focus && repeatable || (!triggered || lasting)) {
	show_debug_message("\ntriggered alert")
	if collision_obj==global.BeanID show_debug_message("big collision " + string(global.BeanID.focus));
	if (instance_exists(oSplit) && collision_obj==oSplit) show_debug_message("small collision " + string(oSplit.focus));
	show_debug_message(global.focus)
	triggered = true;
	if (lasting) {
		this_time_triggered = true;
		scr_TextAlert(alert_text, alert_frames, other, id, print_speed, priority);
	} else if (!this_time_triggered) {
		this_time_triggered = true;
		scr_TextAlert(alert_text, alert_frames, other, id, print_speed, priority);
	}
}


