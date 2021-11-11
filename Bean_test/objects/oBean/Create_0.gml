

image_speed = 0;
image_index = 0;
global.BeanID = id
global.focus = global.BeanID;

alarm_set(2, BEAN_ANIMATION_SPEED);


if (global.from_checkpoint) {
	x = global.checkpoint_x;
	y = global.checkpoint_y;
	global.from_checkpoint = false;
}
