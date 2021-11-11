/// @description Bean behaviours

if (status == 0) {
	if (init_a <= 0) {
		status = 1;
		curr = 0;
	} else {
		init_a -= delt_a;
	}
} else if (status == 1) {
	
	if (curr == 1) {
		vsp = vsp_1;
		hsp = hsp_1;
	} else if (curr == t_1) {
		vsp = vsp_2;
		hsp = hsp_2;
	}
		
	
	curr += 1;

	#region Bean resizing
	global.sizeDiff = global.BeanSize - abs(image_xscale);
	if (global.sizeDiff != 0) {
		play_landing_snd = false;
		image_xscale += sign(image_xscale)*global.sizeDiff / scalingSpeed;
		image_yscale += global.sizeDiff / scalingSpeed;

		global.sizeDiff = global.BeanSize - abs(image_xscale);
	} else {
		play_landing_snd = true;
	}

	maxShootInitSpeed = BASE_MAX_SPD - (global.BeanSize-1)*2;
	wallSlideSpeed = BASE_WALL_SLIDE_SPD + (global.BeanSize-1)*0.5;
	#endregion

	#region Wall contact status
	if (!place_meeting(x, y, oWall)) {
		if (place_meeting(x + 1, y, oWall)) {
			vsp = wallSlideSpeed;
			hContact = 1;
		} else if (place_meeting(x - 1, y, oWall)) {
			vsp = wallSlideSpeed;
			hContact = -1;
		} else {
			hContact = 0;
		}
		if (place_meeting(x, y + 1, oWall)) {
			vContact = 1;
			inair_animation = false;
			if (instance_exists(oPlatform) && place_meeting(x, y+1, oPlatform) && oPlatform.moving && play_landing_snd) {
				play_landing_snd = false;
			}
		} else if (place_meeting(x, y - 1, oWall)){
			vContact = -1;
		} else {
			vContact = 0;
		}
	
		if (play_landing_snd && inAir && (vContact!=0 || hContact!=0)) {
			audio_play_sound(snd_beanLanding, 5, false);
		}
	}
	//show_debug_message("hcontact: "+string(hContact))
	//show_debug_message("bb bottom"+string(bbox_bottom))

	// Bean in the air?
	if (abs(hContact) or abs(vContact)) {
		inAir = false;
	} else { 
		inAir = true;
	}
	#endregion

	#region Bean motion
		// gravity
		if (!global.paused) vsp += grv;
		if (vsp > 32) vsp = 32;


		// Horizontal Collision
		if (place_meeting(x + hsp, y, oWall)) {
			while (!place_meeting(x + sign(hsp), y, oWall)) {
				x = x + sign(hsp);
			}
			hsp = 0;
			vsp = 0;
			//show_debug_message("h collision")
		}
		if (!global.paused) x += hsp;

		// Vertical Collision
		if (place_meeting(x, y + vsp, oWall)) {
			while (!place_meeting(x, y + sign(vsp), oWall)) {
				y = y + sign(vsp);
			}
			vsp = 0;
			hsp = 0;
		}
		if (!global.paused) y += vsp;
	
	
	#endregion

	#region Bean animation

	//var spd = sqrt(vsp*vsp + hsp*hsp);
	if (inAir && inair_animation) {
		if (vsp > 10) {
			image_index = 9;
		} else if (vsp > 5) {
			image_index = 8;
		} else if (vsp > -5) {
			image_index = 7;
		} else if (vsp > -10) {
			image_index = 6;
		} else {
			image_index = 5;
		}
	
		if ((hsp != 0) && sign(hsp) != sign(image_xscale)) image_xscale *= -1;
	}

	// wall sliding
	if (hContact != 0 && vContact == 0 && global.sizeDiff == 0) {
		image_index = 10;
		if (sign(image_xscale) == sign(hContact)) image_xscale *= -1;
	}

	// landed
	if ((vContact == 1) && image_index >= 5) {
		image_index = 0;
	
	}

	//corner
	if (hContact != 0 && vContact == 1) {
		image_index = 11;
		if (sign(image_xscale) == sign(hContact)) image_xscale *= -1;
	}

	#endregion

} else {
	
}
