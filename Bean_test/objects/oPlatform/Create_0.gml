/// @description init

pressure = 0;
vsp = 0;
grv = 0.4;
obj_above = noone;
both_above = false;
pressed = 0;
target_y = y;
moving = false;


pully_snd = noone;


orig = y;

paired_plate = noone;

if (plateform_id != -1) global.platformID[plateform_id] = id;
