/// @description hurt flash

draw_self();

if (hurtFlash > 0 && ((hurtFlash div 10) mod 2)) {
	shader_set(shd_white);
	draw_self();
	shader_reset();
}

//DrawHitBox()

