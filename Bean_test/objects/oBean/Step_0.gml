/// @description Bean behaviours

var BeanOrigW = global.BeanOrigW;

// set transparency according to control focus
if (focus) {
	image_alpha = 1;
} else {
	image_alpha = 0.3;
}

if (!global.paused && hurtFlash > 0) hurtFlash -= 1;


	
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

#region stuck in walls
if (place_meeting(x, y, oWall) && !place_meeting(x, y, oPlatform)) {
	
	/*
	show_debug_message("\n\nin walls");
	if instance_exists(oDoor) && place_meeting(x, y, oDoor.id) {
		show_debug_message("in Door");
		//scr_BeanHealthChange(-1, oBean.id)
	}
	show_debug_message("x, y, r:  " + string(x) + ", " + string(y) + ", " + string(sprite_width/2));
	show_debug_message("ext, sizeDiff, " + string(global.sizeDiff) + ", " + string(BeanOrigW * global.sizeDiff / scalingSpeed / 2 / sqrt(2)))
	*/
	
	hitlist = ds_list_create();
	hitCount = instance_place_list(x, y, oWall, hitlist, true);
	closest = ds_list_find_value(hitlist, 0);
	show_debug_message("closest: " + string(closest.x) + ", " + string(closest.y));
			
	var yneg = BeanOrigW*abs(image_xscale)/sqrt(2)/2 - (closest.y-y-closest.sprite_height/2);
	var ypos = BeanOrigW*abs(image_xscale)/sqrt(2)/2 - (y-closest.y-closest.sprite_height/2);
	var xneg = BeanOrigW*abs(image_xscale)/sqrt(2)/2 - (closest.x-x-closest.sprite_height/2);
	var xpos = BeanOrigW*abs(image_xscale)/sqrt(2)/2 - (x-closest.x-closest.sprite_height/2);
	
	if (position_meeting(closest.x, closest.y-closest.sprite_height/2, oBean)) {
		y -= yneg;
	}
	if (position_meeting(closest.x, closest.y+closest.sprite_height/2, oBean)) {
		y += ypos;
	}
	if (position_meeting(closest.x-closest.sprite_height/2, closest.y, oBean)) {
		x -= xneg;
	}
	if (position_meeting(closest.x+closest.sprite_height/2, closest.y, oBean)) {
		x += xpos;
	}
			
	if (position_meeting(closest.x-closest.sprite_height/2, closest.y-closest.sprite_height/2, oBean)) {
		y -= yneg
		x -= xneg
	}
	if (position_meeting(closest.x+closest.sprite_height/2, closest.y+closest.sprite_height/2, oBean)) {
		y += ypos
		x += xpos
	}
	if (position_meeting(closest.x-closest.sprite_height/2, closest.y+closest.sprite_height/2, oBean)) {
		x -= xneg
		y += ypos
	}
	if (position_meeting(closest.x+closest.sprite_height/2, closest.y-closest.sprite_height/2, oBean)) {
		x += xpos
		y -= yneg
	}
}
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

#region Bean control
if (global.controlable && !global.paused) {
	// drag starts
	if (drag == false and mouse_check_button(mb_left) and focus && oPauseButton.status == 0) {
		x_orig = mouse_x;
		y_orig = mouse_y;
		drag = true;
	}
	// dragging
	if (drag) {
		ang = point_direction(mouse_x, mouse_y, x_orig, y_orig);
		dis = point_distance(mouse_x, mouse_y, x_orig, y_orig);
		if (dis < 128) {
			Speed = maxShootInitSpeed * dis / 128;
		} else {
			Speed = maxShootInitSpeed;
		} 
	}
	// launch
	if (drag && !mouse_check_button(mb_left)) {
		if (!inAir) {
			hsp =  Speed * cos(degtorad(ang));
			vsp = base_vsp - Speed * sin(degtorad(ang));
			base_vsp = 0;
			audio_play_sound(snd_beanLaunch, 7, false);
		}
		drag = false;
		inair_animation = true;
	}
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
		//show_debug_message("v collision, " + string(vsp))
		//_hitlist = ds_list_create();
		//_hitCount = instance_place_list(x, y+vsp, oWall, _hitlist, true);
		//_closest = ds_list_find_value(_hitlist, 0);
		//show_debug_message("closest: " + string(_closest.x) + ", " + string(_closest.y));
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


