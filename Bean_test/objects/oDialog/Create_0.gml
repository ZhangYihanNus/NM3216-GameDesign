/// @description init

activated = false;

dialogs = [
	[0, "OH NO! What is happening?!?!"],
	[1, "Listen King Virus, here is the Jar of Happiness that you've always craved for."],
	[1, "You didn't have to steal it from us."],
	[0, "Huh..? What do you mean?"],
	[1, "Happiness comes from within, King Virus!"],
	[1, "Stealing the Jar of Happiness from us will do nothing if you cannot find happiness within yourself."],
	[1, "By the way, happiness should be shared, not stolen!By the way, happiness should be shared, not stolen!"],
	[0, "You mean... I went through all of that to steal it for nothing..? You must be kidding me."],
	[1, "Yes *chuckles*! All that just to realise that capturing me and the Jar of Happiness was for nothing."],
	[1, "May I go now?"],
	[0, "I guess so.... But stay out of my sight! I never want to see you or your happy family of slimes again. GRRRRRR."],
	[1, "Okay, if you say so. Goodbye!"],
]

gui_h = display_get_gui_height();
gui_w = display_get_gui_width();
box_y = gui_h/4*3-10;
dialog_font = fnt_alert;
name_size = 1.1;
text_size = 1;
prompt_size = 0.9;
prompt_delay = 30;

status = 0;		// off, printing, print finish
dialog_item = 0;
text_showing = "";
end_letter = 0;
text_print_speed = 2;

bean_talk = noone;
boss_talk = noone;

alarm[0] = text_print_speed;

