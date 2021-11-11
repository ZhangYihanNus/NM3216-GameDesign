/// @description update camera position

if (instance_exists(follow)) {
	show_debug_message("follow exists")
	xTargetPos = floor(follow.x / view_w);

	//yTargetPos = floor(follow.y / view_h);
	if (xTargetPos < 0) xTargetPos -= 1;
	//if (yTargetPos < 0) yTargetPos -= 1;


	if (x != xTargetPos*view_w) { //or y != yTargetPos*view_h) {
		xTo = xTargetPos*view_w;
		//yTo = yTargetPos*view_h;
	}

	if (abs(x - xTargetPos*view_w) > 32) { // || abs(y != yTargetPos*view_h) > 32) {
		global.controlable = false;
		control_set = false;
	} else {
		if (!control_set) {
			global.controlable = true;
			control_set = true;
		}
	}

	// smooth shifting between sections
	x += (xTo - x) / 10;
	//y += (yTo - y) / 10;

	// camera shaking
	x += random_range(-shake_remain, shake_remain);
	//y += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));


	camera_set_view_pos(cam, x, y);
}
