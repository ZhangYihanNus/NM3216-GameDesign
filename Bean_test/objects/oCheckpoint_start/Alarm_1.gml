/// @description update sprite


if (triggered) {
	image_index = (image_index + 1) mod 2;
} else {
	image_index = (image_index + 1) mod 2 + 2;
}

alarm_set(1, ENV_UPDATE_FRAMES);
