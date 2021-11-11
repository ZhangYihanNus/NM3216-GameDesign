/// @desc scr_TextAlert(text, full_duration)
/// @arg text
/// @arg full_duration
/// @arg owner_id
/// @arg alert_trigger_id
/// @arg print_speed -1 for default, 0 for no print
/// @arg priority

function scr_TextAlert(_text, _frames, _owner, _triggered_by, _print_speed, _priority){
	if (!_priority) _priority = 0;
	with (oAlert) {
		if (!display_finish and _text == text) {
			if (counting_frames and frames < _frames) frames = _frames;
			if (_triggered_by) triggered_by = _triggered_by;
		} else if (_priority > priority) {
			
			if (_text == "") {
				display_finish = true;
			} else {
				text = _text;
				frames = _frames;
				owner = _owner;
				if (_print_speed >= 0) {
					if (_print_speed == 0) {
						text_print_speed = DEFAULT_TEXT_SPEED;
						end_letter = string_length(_text);
					} else {
						text_print_speed = _print_speed;
					}
				} else {
					text_print_speed = DEFAULT_TEXT_SPEED;
				}
				priority = _priority;
				if (_triggered_by) triggered_by = _triggered_by;
			}
		}
	}
}
