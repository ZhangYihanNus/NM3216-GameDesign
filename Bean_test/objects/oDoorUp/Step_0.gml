/// @description set scale and size

openPercentPrevious = openPercent;

#region update openPercent
if (opening && openPercent != 0.9) {
	openPercent += (0.9 - openPercent) / animationSpeed;
	
} else if ((!opening) && openPercent != 0) {
	openPercent += (0 - openPercent) / animationSpeed;
}
#endregion

image_yscale = (1-openPercent);

diff = abs(openPercent - openPercentPrevious);



#region bean collision
while (place_meeting(x, y, oBean)) {
	var bean_obj = noone;
	if (instance_exists(oSplit) && place_meeting(x, y, oSplit)) {
		bean_obj = oSplit.id;
	}
	if (place_meeting(x, y, global.BeanID)) {
		bean_obj = global.BeanID;
	}
	var bean_w = bean_obj.bbox_right - bean_obj.bbox_left;
	var bean_h = bean_obj.bbox_bottom - bean_obj.bbox_top;
	
	
	if (bean_obj.y < bbox_top+doorH*diff) {
		if (bean_obj) {
			var upDis = bean_obj.bbox_bottom - bbox_top;
			bean_obj.y -= upDis + global.BeanSize;
		}
		
	} else {
		var leftDis = bean_obj.x - bbox_left + bean_w/2;
		var rightDis = bbox_right - bean_obj.x + bean_w/2;
		var dir = sign(leftDis - rightDis);		// -1 for left, 1 for right
		if (dir == -1) {
			bean_obj.x -= leftDis+2;
		} else {
			bean_obj.x += rightDis+2;
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
