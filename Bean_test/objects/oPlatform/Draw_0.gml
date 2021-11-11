/// @description draw rope and self


// draw rope
var _y = y - 128;
while (_y >= rope_limit + 64) {
	draw_sprite(spr_rope, 0, x, _y);
	_y -= 64;
}
draw_sprite_part(spr_rope, 0, 0, 64-(_y-rope_limit), sprite_width, _y-rope_limit, x-32, _y-(_y-rope_limit))

draw_self();
