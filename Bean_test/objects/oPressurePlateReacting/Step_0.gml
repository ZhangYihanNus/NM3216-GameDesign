/// @description change state

#region pressed behaviors
if (pressed) {
	global.plateTriggered[plate_id] = true;
	image_yscale = pressedYScale;
} else {
	global.plateTriggered[plate_id] = false;
	image_yscale = 1;
}
#endregion

#region collision with oBean
if (place_meeting(x, y, oBean)) {
	var bean_obj;
	if (place_meeting(x, y, oSplit)) bean_obj = oSplit;
	else bean_obj = oBean;
	var shoveAmount = bbox_top - bean_obj.bbox_bottom;
	bean_obj.y += shoveAmount-1;
}
#endregion

#region detect and decide pressed
if (place_meeting(x, y-1-(1-pressedYScale)*plate_h, oBean)) {
	
	var _text = "I need to be heavier to trigger this...";
	
	#region set pressure on plate
	// only split
	if (instance_exists(oSplit) 
		&& place_meeting(x, y-1-(1-pressedYScale)*plate_h, oSplit.id) 
		&& !place_meeting(x, y-1-(1-pressedYScale)*plate_h, oBean.id)) {
		show_debug_message(string("only split"))
		pressure = 1;
		if (pressure < threshold) {
			pressed = false;
			scr_TextAlert(_text, 60, oSplit, noone, noone, 1);
		} else pressed = true;
	}
	// only bean
	else if (!place_meeting(x, y-1-(1-pressedYScale)*plate_h, oSplit)) {
		pressure = global.BeanSize;
		if (pressure < threshold) {
			pressed = false;
			scr_TextAlert(_text, 60, oBean, noone, noone, 1);
		} else pressed = true;
	}
	// together on plate
	else if (instance_exists(oSplit) 
		&& place_meeting(x, y-1-(1-pressedYScale)*plate_h, oSplit.id) 
		&& place_meeting(x, y-1-(1-pressedYScale)*plate_h, oBean.id)) {
		pressure = global.BeanSize + 1;
		if (pressure < threshold) {
			pressed = false;
			scr_TextAlert(_text, 60, oBean, noone, noone, 1);
		} else pressed = true;
	}
	#endregion
	
	
	
	
	
} else if (pressed && !place_meeting(x, y-1-(1-pressedYScale)*plate_h, oBean)) {
		pressed = false;
}
#endregion
