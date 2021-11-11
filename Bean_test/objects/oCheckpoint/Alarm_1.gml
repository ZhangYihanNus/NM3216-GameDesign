/// @description update sprite


if (triggered) {
	if (!global.paused) image_index = (image_index + 1) mod 2;
} else {
	if (!global.paused) image_index = (image_index + 1) mod 2 + 2;
}

alarm_set(1, ENV_UPDATE_FRAMES);
