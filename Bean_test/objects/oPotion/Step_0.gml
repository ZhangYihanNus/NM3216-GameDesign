/// @description behaviours


#region eaten
if (flash > 0) {
	if (flash == 1) {
		x += (eatenBy.x - x) / 3 * 2;
		y += (eatenBy.y - y) / 3 * 2;
		
		// eaten, do something
		oBoss.locked = true;
		oCage.grv = 0.6;
		
		destroyed = true;
	} else {
		x += (eatenBy.x - x) / 6;
		y += (eatenBy.y - y) / 6;
	}
	
	flash -= 1;
}
#endregion