/// @description update checkpoint

if (!triggered) {
	if (instance_exists(oSplit)) {
		var checkpoint_text = "Checkpoint cannot be activated when spliting!";
		scr_TextAlert(checkpoint_text, 120, other, noone, noone, 3);
	} else {
		triggered = true;
		if (global.show_checkpoint_msg) {
			scr_TextAlert("Checkpoint reached, game saved!", 120, other, noone, noone, 3);
		} else global.show_checkpoint_msg = true;
	
		// save room and bean status
		global.checkpoint_x = x + 64;
		global.checkpoint_y = y - 112;
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


