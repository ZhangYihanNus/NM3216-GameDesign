/// @desc scr_BeanHealthChange(count, obj) 
/// @arg count indecates the amount and sign of health change.
/// @arg obj indecates the object that triggered health change.

function scr_BeanHealthChange(count, obj) {

	with (obj) {
		if (count > 0) {
			global.BeanHealth += count;
			if (global.BeanHealth > global.BeanHealthMax) global.BeanHealth = global.BeanHealthMax;
		}
	
		if (count < 0) and (obj.hurtFlash == 0) {
			audio_play_sound(snd_lifeDrop, 7, false);
			obj.hurtFlash = global.invincibleFrames;
			obj.vsp = -obj.vsp/2;
			obj.hsp = -obj.hsp/2;
			global.BeanHealth += count;
			scr_ScreenShake(8, 20);
			if (global.BeanHealth < 0) global.BeanHealth = 0;
			
		}
	}
}
	