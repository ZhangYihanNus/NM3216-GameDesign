/// @description update checkpoint

if (!triggered) {
	if (instance_exists(oSplit)) {
		var checkpoint_text = "Checkpoint cannot be activated when spliting!";
		//scr_TextAlert(checkpoint_text, 120, other);
	} else {
		triggered = true;
		// save room and bean status
		global.checkpoint_x = x + 64;
		global.checkpoint_y = y - 224;
		global.checkpoint_room = room;
	
	
		// overwrite old save
		if (file_exists(SAVEFILE)) {
			file_delete(SAVEFILE);
		}
		// create new save
		var file;
		file = file_text_open_append(SAVEFILE);
		file_text_write_real(file, global.checkpoint_x);
		file_text_write_real(file, global.checkpoint_y);
		file_text_writeln(file);
		file_text_write_real(file, global.checkpoint_room);
		file_text_writeln(file);
		file_text_write_real(file, global.BeanHealth);
		file_text_write_real(file, global.BeanSize);
		file_text_close(file);
	}
}


