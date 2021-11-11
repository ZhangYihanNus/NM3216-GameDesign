/// @description Setup camera

cam = view_camera[0];
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);
follow = oBean;

x = 0;
y = 0;
xTo = x;
yTo = y;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
control_set = false;

