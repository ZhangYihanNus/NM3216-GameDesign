/// @description frames count down
if (display_finish) {
	priority = -1;
	counting_frames = false;
	end_letter = 0;
	text_showing = "";
	if (triggered_by and instance_exists(triggered_by)) triggered_by.this_time_triggered = true;
	if (triggered_by and instance_exists(triggered_by)) triggered_by = noone;
}

if (instance_exists(owner) && owner.focus) {
//if (instance_exists(owner)) {

	#region get textbox positions
	if (owner.x-camera_get_view_x(view_camera[0]) > w/2) hpos = 1;
	else hpos = -1;
	if (owner.y-camera_get_view_y(view_camera[0]) > h/2) vpos = 1;
	else vpos = -1;

	text_h = string_height_ext(text_showing, text_sep, (rec_w - 2*text_padding_x) / text_xscale);
	rec_h = text_h + 2*text_padding_y;
	owner_r = global.BeanOrigW * global.BeanSize / 2;
	owner_gap = 15;

	if (hpos > 0) {
		rec1_x = owner.x - owner_r - owner_gap;
		rec2_x = rec1_x - rec_w;
		text_x = rec2_x + text_padding_x;
	} else {
		rec1_x = owner.x + owner_r + owner_gap;
		rec2_x = rec1_x + rec_w;
		text_x = rec1_x + text_padding_x;
	}
	if (vpos > 0) {
		rec1_y = owner.y + owner_r;
		rec2_y = rec1_y - rec_h;
		text_y = rec2_y + text_padding_y;
	} else {
		rec1_y = owner.y - owner_r;
		rec2_y = rec1_y + rec_h;
		text_y = rec1_y + text_padding_y;
	}

	rec1_x -= camera_get_view_x(view_camera[0]);
	rec1_y -= camera_get_view_y(view_camera[0]);
	rec2_x -= camera_get_view_x(view_camera[0]);
	rec2_y -= camera_get_view_y(view_camera[0]);
	text_x -= camera_get_view_x(view_camera[0]);
	text_y -= camera_get_view_y(view_camera[0]);
	#endregion


	if (frames > 0) {
		display_finish = false;
	}

	if (counting_frames) {
		// start frames count down
		if (frames > 0) {
			frames -= 1;
		} else {
			display_finish = true;
		}
	}
} else {
	display_finish = true;	
	frames = 0;
}
