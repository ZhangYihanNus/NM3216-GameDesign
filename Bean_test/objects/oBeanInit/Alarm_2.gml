/// @description image index

if (vContact == 1 && hContact == 0 && !global.paused) {
	if (image_index >= 4) image_index = 0;
	else image_index += 1;
}

alarm[2] = BEAN_ANIMATION_SPEED
