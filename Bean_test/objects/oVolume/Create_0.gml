/// @description init

if (!audio_group_is_loaded(bgm_music)) {
	show_debug_message("loading audio")
	audio_group_load(bgm_music);
	audio_group_load(sound_effects);
}

control = true;

dragging = false;
x_orig = x;
x_limit = 200;
x_base = x_orig - x_limit;
button_scale = 1;
