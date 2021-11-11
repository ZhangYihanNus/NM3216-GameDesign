/// @description destroy virus instance

if (destroyed) {
	audio_play_sound(snd_eatVirus, 7, false);
	instance_destroy();
}
