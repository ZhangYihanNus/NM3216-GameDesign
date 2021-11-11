/// @description switch focus


if (!global.focus.drag) {
	if (instance_exists(oSplit)) {
		focus = !focus;
		oSplit.focus = !focus;
		if (global.focus == oSplit.id) global.focus = id;
		else global.focus = oSplit.id;
	
		// switch camera follow
		if (focus) {
			oCamera.follow = oBean;
		} else {
			oCamera.follow = oSplit;
		}
	}
}
	

