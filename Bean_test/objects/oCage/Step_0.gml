/// @description ?


// gravity
	if (!global.paused) vsp += grv;
	if (vsp > 32) vsp = 32;


	// Vertical Collision
	if (place_meeting(x, y + vsp, oWall)) {
		while (!place_meeting(x, y + sign(vsp), oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
		if (!dialog_activated && initial_count == initial_delay) {
			oDialog.activated = true;
			dialog_activated = true;
		}
		if (!played_sound) {
			audio_play_sound(snd_lockBoss, 5, false);
			played_sound = true;
		}
		if (initial_count != initial_delay) {
			initial_count += 1;
		}
		
		
	}
	if (!global.paused) y += vsp;