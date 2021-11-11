/// @description init variables

image_speed = 0;
image_index = requireKey;

doorW = sprite_width;

opening = false;
openPercent = 0;
openPercentPrevious = 0;

animationSpeed = 10;

global.doorOpen[door_id] = initial_open;
opening = initial_open;
