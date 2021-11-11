/// @desc 
function scr_Pause(){
	global.paused = !global.paused;
	
	if (global.paused) {
		global.controlable = false;
		with (all) {
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
	} else {
		global.controlable = true;
		with (all) {
			image_speed = gamePausedImageSpeed;
		}
	}
}