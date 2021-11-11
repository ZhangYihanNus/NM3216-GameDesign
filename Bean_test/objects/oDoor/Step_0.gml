/// @description set scale and size

openPercentPrevious = openPercent;

#region update openPercent
if (opening && openPercent != 0.9) {
	openPercent += (0.9 - openPercent) / animationSpeed;
	
} else if ((!opening) && openPercent != 0) {
	openPercent += (0 - openPercent) / animationSpeed;
}
#endregion

image_yscale = !opening;



#region bean collision
if (place_meeting(x, y, oBean)) {
	var bean_obj;
	if (instance_exists(oSplit) && place_meeting(x, y, oSplit)) {
		bean_obj = oSplit.id
	} else {
		bean_obj = oBean.id
	}
	var bean_w = bean_obj.bbox_right - bean_obj.bbox_left;
	var bean_h = bean_obj.bbox_bottom - bean_obj.bbox_top;
		
	if ((1-openPercent)*sprite_height+y > bean_obj.y-bean_h/2) {
		var leftDis = bean_obj.x - bbox_left + bean_w/2;
		var rightDis = bbox_right - bean_obj.x + bean_w/2;
		var dir = sign(leftDis - rightDis);		// -1 for left, 1 for right
		if (dir == -1) {
			bean_obj.x -= leftDis;
		} else {
			bean_obj.x += rightDis;
		}
	}
}
#endregion


		
#region open condition
if (opening != global.doorOpen[door_id]) {
	audio_play_sound(snd_gate, 7, false);
	opening = global.doorOpen[door_id];
}

#endregion
