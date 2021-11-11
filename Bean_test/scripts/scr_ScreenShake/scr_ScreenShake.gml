/// @desc scr_ScreenShake(magnitude, frames)
/// @arg magnitude
/// @arg frames


function scr_ScreenShake(mag, frames){
	with (oCamera) {
		if (mag > shake_remain) {
			shake_magnitude = mag;
			shake_remain = mag;
			shake_length = frames;
		}
	}
}