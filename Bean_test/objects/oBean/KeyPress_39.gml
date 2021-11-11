/// @description DEBUG - health + 1
if (global.debug) {
	if (instance_exists(oSplit) and oSplit.focus) {
		scr_BeanHealthChange(1, oSplit);
	} else {
		scr_BeanHealthChange(1, oBean);
	}
}

