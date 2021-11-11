/// @description change state

y = follow_plate.y;

if (pulled) {
	global.leverTriggered[lever_id] = true;
	image_index = 1;
} else {
	global.leverTriggered[lever_id] = false;
	image_index = 0;
}

var bean_obj;
if (instance_exists(oSplit) && oSplit.focus) {
	bean_obj = oSplit.id;
} else {
	bean_obj = global.BeanID;
}

if (place_meeting(x, y, bean_obj)) {
	
	if (!msgShown) {
		var _text = "Press 'D' to pull the lever";
		scr_TextAlert(_text, 60, bean_obj, noone, noone, 2);
		msgShown = true;
	}
	
	if (keyboard_check_pressed(ord("D"))) {
		audio_play_sound(snd_lever, 7, false);
		pulled = !pulled;
	}
}
