#macro SAVEFILE "save.sav"
#macro UI_MARGIN 32
#macro UI_HEALTHSEPARATION 64
#macro DEATHANIMATIONFRAMES 60
#macro DEATHVSP -10
#macro ENV_UPDATE_FRAMES 30
#macro DEFAULT_TEXT_SPEED 2
#macro BEAN_ANIMATION_SPEED 10
#macro BASE_MAX_SPD 20
#macro BASE_WALL_SLIDE_SPD 1.5

#macro INIT_ROOM_NUM 2
#macro HOME_ROOM_NUM 4
#macro LEVEL_ROOM_NUM 5
#macro INSTRUCTIONS_ROOM_NUM 3
#macro CREDIT_ROOM_NUM 1
#macro LVL1_ROOM_NUM 8
#macro LVL2_ROOM_NUM 6
#macro LVL3_ROOM_NUM 0
#macro END_ROOM_NUM 7

global.debug = false;

global.split = false;
global.paused = false;
global.BeanHealth = 3;
global.BeanHealthMax = 3;
global.invincibleFrames = 120;
global.controlable = false;
global.BeanSize = 1;
global.sizeDiff = 0;
global.BeanOrigW = 64;
global.haveKey = false;
global.music_volume = 1;
global.music_base = 0.1;
global.sfx_volume = 1;
global.sfx_base = 0.9;
global.BGM = noone;

global.from_checkpoint = false;
global.checkpoint_x = 0;
global.checkpoint_y = 0;
global.checkpoint_room = 0;
global.show_checkpoint_msg = true;

global.leverTriggered = [20];
global.plateTriggered = [20];
global.doorOpen = [20];
global.platformID = [4];
show_debug_message("init menu number:")
show_debug_message(room)
show_debug_message(room_get_name(room))
//room_goto_next();