/// @description Control camera & movement

if (obj_game.paused) exit

#region Camera
var window_center_x = window_get_width() / 2
var window_center_y = window_get_height() / 2
var sens_divisor = 10 / sensitivity

yaw += (window_center_x - window_mouse_get_x()) / sens_divisor
pitch += (window_center_y - window_mouse_get_y()) / sens_divisor
pitch = clamp(pitch, -90, 90)

// Reset mouse position
window_mouse_set(window_center_x, window_center_y)
#endregion

#region Movement
if (keyboard_check(ord("W"))) {
	x += dcos(yaw) * move_speed
	y -= dsin(yaw) * move_speed  // because y is inverted
}
if (keyboard_check(ord("S"))) {
	x -= dcos(yaw) * move_speed
	y += dsin(yaw) * move_speed
}
if (keyboard_check(ord("A"))) {
	x -= dsin(yaw) * move_speed  // dcos(yaw + 90) = -dsin(yaw)
	y -= dcos(yaw) * move_speed  // dsin(yaw + 90) = dcos(yaw)
}
if (keyboard_check(ord("D"))) {
	x += dsin(yaw) * move_speed
	y += dcos(yaw) * move_speed
}
if (keyboard_check(vk_space)) {
	z -= move_speed  // for some reason z is also inverted
}
if (keyboard_check(vk_shift)) {
	z += move_speed
}
#endregion
