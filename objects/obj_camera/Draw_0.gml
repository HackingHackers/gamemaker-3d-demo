/// @description Set up and render camera view

// Manually draw black frame to prevent "solitaire effect"
draw_clear(c_black)

var camera = camera_get_active();

var xfr = obj_player.x  // xfrom
var yfr = obj_player.y
var zfr = obj_player.z
var xto = xfr + dcos(obj_player.yaw)  // dcos for degrees as opposed to radians
var yto = yfr - dsin(obj_player.yaw)
var zto = zfr - dsin(obj_player.pitch)

var view_mat = matrix_build_lookat(xfr, yfr, zfr, xto, yto, zto, 0, 0, 1)
var proj_mat = matrix_build_projection_perspective_fov(90, window_get_width() / window_get_height(), 1, 32000)

camera_set_view_mat(camera, view_mat)
camera_set_proj_mat(camera, proj_mat)
camera_apply(camera);

//vertex_submit(obj_game.vbuffer, pr_trianglelist, -1)
