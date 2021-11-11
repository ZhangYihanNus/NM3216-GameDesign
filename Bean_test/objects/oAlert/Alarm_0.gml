/// @description print text
if (!display_finish) {
	if (end_letter < string_length(text)) {
		end_letter += 1;
		if (end_letter == string_length(text)) {
			counting_frames = true;
		}
	}

	text_showing = string_copy(text, 0, end_letter);
}

alarm_set(0, text_print_speed);
