/// @description set collision object
eatenBy = other;
if (global.BeanSize >= size) {
	if (!eating) flash = 6;
	eating = true;
} else {
	scr_BeanHealthChange(-1, other);
}



