/// @description draw frame

var frameIndex = pressed;
if (frameIndex == 0) {
	// turn green condition
	if (global.plateTriggered[plate_id]) frameIndex = 2;
}

draw_sprite(sprite_index, frameIndex, x, y)

//DrawHitBox();
