/// @description draw button

var button_size;

if (status == 0) button_size = 0.9;
else if (status == 1) button_size = 1;
else button_size = 0.8;

draw_sprite_ext(spr_pause, 0, button_x, button_y, button_size, button_size, 0, c_white, 1);

