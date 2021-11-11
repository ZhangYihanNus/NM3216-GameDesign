/// @description create object oSplit
if (!global.focus.drag) {
	if (!global.split) {
		if (global.BeanSize <= 1) {
			scr_TextAlert("Grow bigger to split!", 120, oBean, noone, noone, 3);
		} else {
			global.BeanSize -= 1;
			instance_create_layer(x, bbox_bottom-21, "Split", oSplit);
	
			// switch focus to Split
			focus = !focus;
			oSplit.focus = !focus;
			global.focus = oSplit.id;

			// switch camera follow to oSplit
			oCamera.follow = oSplit;
			global.split = true;
		} 
	} else {
		with (oSplit) {
			if (point_distance(x, y, oBean.x, oBean.y) <= (global.BeanOrigW*global.BeanSize/2+24) and !merging) {
			
				merging = true;
			} else if (point_distance(x, y, oBean.x, oBean.y) > (global.BeanOrigW*global.BeanSize/2+24) and !merging) {
				scr_TextAlert("Get closer to merge!", 120, global.focus, noone, noone, 3);
			}
		}
	}
}



