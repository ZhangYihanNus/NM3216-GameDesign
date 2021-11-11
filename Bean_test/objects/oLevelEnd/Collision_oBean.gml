/// @description set Bean collision

if ((instance_exists(oSplit) && place_meeting(x, y, oSplit.id) && place_meeting(x, y, oBean.id)) 
|| !instance_exists(oSplit)) {
	if (!triggered) {
		triggered = true;
		audio_play_sound(snd_exit, 7, false);
	}
}
