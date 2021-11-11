/// @description print text
if (activated) {
	if (end_letter < string_length(dialog_msg)+prompt_delay) {
		end_letter += 1;
	}

	text_showing = string_copy(dialog_msg, 0, end_letter);

}
alarm_set(0, text_print_speed);
