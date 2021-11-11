/// @description behaviours


#region eaten
if (flash > 0) {
	if (flash == 1) {
		x += (eatenBy.x - x) / 3 * 2;
		y += (eatenBy.y - y) / 3 * 2;
		
		// eaten, do something
		
		destroyed = true;
	} else {
		x += (eatenBy.x - x) / 6;
		y += (eatenBy.y - y) / 6;
	}
	
	flash -= 1;
}
#endregion

