
if (!instance_exists(oDialog) || (!oDialog.activated)) {
	#region Draw Health
	var _BeanHealth = global.BeanHealth;
	var _BeanHealthMax = global.BeanHealthMax;

	for (var i = 1; i <= _BeanHealthMax; i++) {
		draw_sprite(spr_HP,
		(i > _BeanHealth),
		UI_MARGIN*1 + (i-1) * UI_HEALTHSEPARATION,
		UI_MARGIN
		)
	}
	#endregion


	#region Draw Key
var _haveKey = global.haveKey
if (!(room == LVL1_ROOM_NUM || (room == LVL3_ROOM_NUM && x > 3240))) {
	if _haveKey {
		draw_sprite_ext(spr_key, 0,
		UI_MARGIN*4,
		UI_MARGIN*2 + 72, 
		1, 1, 45, c_white, 1
		)
	} else {
		draw_sprite_ext(spr_keyEmpty, 0,
		UI_MARGIN*4,
		UI_MARGIN*2 + 72, 
		1, 1, 45, c_white, 1
		)
	}
}
#endregion
}

#region Draw slingshot indication
if (drag && !global.paused) {
	// slime indication dots
	for (i = 0; i < 19; i++) {
		if (i mod 2 == 0) {
			var X = i * Speed * cos(degtorad(ang));
			var Y = scr_BeanMotion(X, Speed, ang, 0, 0, grv);
			draw_sprite_ext(
				spr_BeanPathDots, 0, 
				x + X-camera_get_view_x(view_camera[0]), 
				y - Y-camera_get_view_y(view_camera[0]), 
				2*motionPathScale/(i/2+motionPathScale-1), 
				2*motionPathScale/(i/2+motionPathScale-1), 
				0, c_white, 1
			);
		}
	}
	
	// cursor dragging indication
	draw_set_alpha(1);
	draw_set_color(c_white);
	for (var r = 15; r > 12; r--) {
		draw_circle(
			x_orig-camera_get_view_x(view_camera[0]), 
			y_orig-camera_get_view_y(view_camera[0]), 
			r, true
		);
	}
	
	var tempDis;
	if (dis > 5) tempDis = 5; else tempDis = dis;
	var tempx = x_orig - cos(degtorad(ang)) * tempDis;
	var tempy = y_orig + sin(degtorad(ang)) * tempDis;
	draw_circle(
		tempx-camera_get_view_x(view_camera[0]), 
		tempy-camera_get_view_y(view_camera[0]), 
		5, false
	);
	draw_set_alpha(1);
	
}
#endregion
