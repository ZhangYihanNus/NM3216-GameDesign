/// @desc scr_SlideTransition(mode, targetRoom) 
/// @arg Mode sets transition mode.
/// @arg Target sets target room for goto mode.

with(oTransition) {
	show_debug_message("transition start")
	mode = argument[0];
	if (argument_count > 1) target = argument[1];
	
}
	