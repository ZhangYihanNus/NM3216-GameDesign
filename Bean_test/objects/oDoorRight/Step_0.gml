/// @description set scale and size

openPercentPrevious = openPercent;

#region update openPercent
if (opening && openPercent != 0.9) {
	openPercent += (0.9 - openPercent) / animationSpeed;
	
} else if ((!opening) && openPercent != 0) {
	openPercent += (0 - openPercent) / animationSpeed;
}
#endregion

image_xscale = !opening*actual_xscale;



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
		
	
	/*
	if (x+(1-openPercent)*sprite_width < bean_obj.x+bean_w/2 
		&& x+(1-openPercent)*sprite_width > bean_obj.x-bean_w/2
		&& openPercent>0) {
		var rightDis = bbox_right - bean_obj.x + bean_w/2;
		bean_obj.x += rightDis;
	} else {*/
		var upDis = bean_obj.y - bbox_top + bean_h/2;
		var downDis = bbox_bottom - bean_obj.y + bean_h/2;
		var dir = sign(upDis - downDis);		// -1 for up, 1 for down
		if (dir == -1) {
			bean_obj.y -= upDis+global.BeanSize;
		} else {
			bean_obj.y += downDis+global.BeanSize;
		}
	//}
	
	
	
}
#endregion


		
#region open condition
if (opening != global.doorOpen[door_id]) {
	audio_play_sound(snd_gate, 7, false);
	opening = global.doorOpen[door_id];
}
#endregion
