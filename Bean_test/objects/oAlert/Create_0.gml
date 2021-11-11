/// @description alert box variables

w = display_get_gui_width();
h = display_get_gui_height();

rec_w = 512;

text_padding_x = 30;
text_padding_y = 20;
text_color = c_white;
text_xscale = 1.2;
text_yscale = 1;
text_sep = 50;
text_alpha = 1;
text_showing = "";
end_letter = 0;
text_print_speed = 2;
triggered_by = noone;

counting_frames = false;
display_finish = true;
end_letter = 0;

priority = -1;

alarm[0] = text_print_speed;	// start printing

