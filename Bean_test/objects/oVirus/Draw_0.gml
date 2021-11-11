/// @description draw flash

draw_self();

if (flash > 0) {
	shader_set(shd_white);
	draw_self();
	shader_reset();
}
