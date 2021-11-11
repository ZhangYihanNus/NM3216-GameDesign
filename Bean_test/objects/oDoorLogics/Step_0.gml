/// @description door logics

if (room_get_name(room) == "Room1") {
	// 0
	global.doorOpen[0] = global.leverTriggered[0]
} else if (room_get_name(room) == "Room2") {

	//show_debug_message("door logic room 2");
	// 1
	if (global.leverTriggered[1] != leverTriggered1 || global.leverTriggered[2] != leverTriggered2) {
		//show_debug_message("door 1 logic change");
		global.doorOpen[1] = !global.doorOpen[1];
		leverTriggered1 = global.leverTriggered[1];
		leverTriggered2 = global.leverTriggered[2];
	}

	// 2
	global.doorOpen[2] = global.leverTriggered[2];
	
	// 3
	global.doorOpen[3] = global.leverTriggered[10];
	
	// 4
	global.doorOpen[4] = global.leverTriggered[4];
	// 5
	global.doorOpen[5] = global.leverTriggered[5];
	// 6
	global.doorOpen[6] = global.leverTriggered[6];
	
} else if (room_get_name(room) == "Room3") {

	// 7
	global.doorOpen[7] = global.leverTriggered[7];
	// 8
	global.doorOpen[8] = global.leverTriggered[10];
	
	// 9
	global.doorOpen[9] = global.leverTriggered[11];
	
	//10
	global.doorOpen[10] = global.leverTriggered[12];
	
	
	// 11, 12, 13
	global.doorOpen[11] = !global.leverTriggered[9];

	global.doorOpen[12] = !global.leverTriggered[8];
	
	global.doorOpen[13] = global.leverTriggered[8];
}

