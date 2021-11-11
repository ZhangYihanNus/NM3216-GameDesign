/// @description virus behaviours

#region floating

if (float_dir == -1 && y >= min_y+5) {
	if (!global.paused) y += (min_y - y) / float_speed;
} else if (float_dir == 1 && y <= max_y-5) {
	if (!global.paused) y += (max_y - y) / float_speed;
} else {
	float_dir *= -1;
}
		

#endregion


#region virus eaten
if (flash > 0) {
	if (flash == 1) {
		x += (eatenBy.x - x) / 3 * 2;
		y += (eatenBy.y - y) / 3 * 2;
		if (!grownBean) {
			// adjust Bean params
			//global.BeanSize += 1;
			//global.sizeDiff = 1;
			//eatenBy.maxShootInitSpeed -= 2;
			//eatenBy.wallSlideSpeed += 0.5;

			grownBean = true;
		}
		destroyed = true;
	} else {
		x += (eatenBy.x - x) / 6;
		y += (eatenBy.y - y) / 6;
	}
	
	flash -= 1;
}
#endregion

// gravity
vsp += grv;
if (vsp > 64) vsp = 64;



// Horizontal Collision
if (place_meeting(x + hsp, y, oWall)) {
	while (!place_meeting(x + sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
	vsp = 0;
}
x += hsp;

// Vertical Collision
if (place_meeting(x, y + vsp, oWall)) {
	while (!place_meeting(x, y + sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
	hsp = 0;
}
y += vsp;

image_xscale = size;
image_yscale = size;

