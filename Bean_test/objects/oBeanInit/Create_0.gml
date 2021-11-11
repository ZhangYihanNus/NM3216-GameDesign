

image_speed = 0;
image_index = 0;

w = display_get_gui_width();
h = display_get_gui_height();

status = 0;

delt_a = 0.02;
init_a = 1;

curr = 0;
vsp_1 = 8;
hsp_1 = 12;
t_1 = 60;

vsp_2 = 16;
hsp_2 = 12;
t_2 = 60;

alarm_set(2, BEAN_ANIMATION_SPEED);

