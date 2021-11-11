/// @description update checkpoint

if (other != oCheckpoint_start) {

	if (instance_exists(oSplit)) {
		var checkpoint_text = "Checkpoint cannot be activated when spliting!";
		scr_TextAlert(checkpoint_text, 120, instance_id);
	}

}
