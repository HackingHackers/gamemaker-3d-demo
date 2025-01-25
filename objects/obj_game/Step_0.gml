/// @description Meta game tasks

if (keyboard_check_pressed(vk_escape)) paused = !paused
if (mouse_check_button_pressed(mb_left)) paused = false

if (paused) {
	obj_debug.text = "paused"
} else {
	obj_debug.text = ""
}

// Fail-safe force quit
if (keyboard_check_direct(vk_shift) && keyboard_check_direct(vk_escape)) {
	game_end()
}
