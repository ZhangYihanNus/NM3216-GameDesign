/// @description each frame

if (paired != -1) paired_plate = global.platformID[paired];
else paired_plate = noone;

#region detect and decide pressed
var force = 0;

if (paired_plate != noone) {
	pull = -paired_plate.pressure;
	force += pull;
}
	

	#region set pressure on plate
	if (place_meeting(x, y-1, oBean)) {
		// only split
		if (instance_exists(oSplit) 
			&& place_meeting(x, y-1, oSplit.id) 
			&& !place_meeting(x, y-1, oBean.id)) {
			obj_above = oSplit.id;
			both_above = false;
		
			pressure = 0.8;
		}
		// only bean
		else if (!place_meeting(x, y-1, oSplit)) {
			obj_above = global.BeanID
			both_above = false;
		
			pressure = global.BeanSize;
		}
		// together on plate
		else if (instance_exists(oSplit) 
			&& place_meeting(x, y-1, oSplit.id) 
			&& place_meeting(x, y-1, oBean.id)) {
			both_above = true;
			obj_above = noone;
		
			pressure = global.BeanSize + 0.8;
		} else {
			//show_debug_message("\n--THIS SHOULD NEVER HAPPEN--\n")	
		}
	
	} else {
		both_above = false;
		obj_above = noone;
		pressure = 0;
	}
	#endregion

force += pressure;
if (force < -threshold) {
	pressed = -1	
} else if (force <= threshold) {
	pressed = 0;
} else pressed = 1;

#endregion


if (pressed == 1) target_y = low;
else if (pressed == -1) target_y = high;
else target_y = orig;


#region move to target_y

if (abs(target_y - y) > 0.1 && !global.paused) {
	if (!moving) {
		pully_snd = audio_play_sound(snd_pullyWheel, 5, true);
	}
	moving = true;
	if (target_y > y) {
		vsp += grv;
		var shove = (target_y - y) / 10;
		if (vsp > shove) vsp = shove; 
		y += vsp;
	} else if (target_y < y) {
		vsp -= grv;
		var shove = (target_y - y) / 10;
		if (vsp < shove) vsp = shove; 
		y += vsp;
	}

	if (both_above) {
		global.BeanID.y += vsp;
		oSplit.y += vsp;
		
		global.BeanID.base_vsp = vsp;
		oSplit.base_vsp = vsp;
	} else if (obj_above == global.BeanID) {
		global.BeanID.y += vsp;
		global.BeanID.base_vsp = vsp;
	} else if (instance_exists(oSplit) && obj_above == oSplit.id) {
		oSplit.y += vsp;
		oSplit.base_vsp = vsp;
	}
} else {
	moving = false;
}
#endregion


#region stop sound
if (!moving) {
	if (pully_snd) {
		audio_stop_sound(pully_snd);
	}
}
#endregion


#region bean collision
var bean_obj;
if (instance_exists(oSplit) && place_meeting(x, y, oSplit)) {
	bean_obj = oSplit.id
	var bean_h = bean_obj.bbox_bottom - bean_obj.bbox_top;	
	bean_obj.y = y - ceil(bean_h/2) - 1;
}
if (place_meeting(x, y, global.BeanID)) {
	bean_obj = global.BeanID;
	var bean_h = bean_obj.bbox_bottom - bean_obj.bbox_top;
	bean_obj.y = y - ceil(bean_h/2) - global.BeanSize;
}
#endregion