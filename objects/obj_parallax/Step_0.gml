var near = layer_get_id("background_near");
var stillNear = layer_get_id("background_stillnear");
var distant = layer_get_id("background_distant");
var farAway = layer_get_id("background_FarAway");

var distant2 = layer_get_id("sobre_parede_blocos");
var distant3 = layer_get_id("parede_blocos");

var distant4 = layer_get_id("ambientacao");
var distant5 = layer_get_id("rachaduras");

layer_x(near,	lerp(0, camera_get_view_x(view_camera[0]), 0.5)	);
layer_x(stillNear,	lerp(0, camera_get_view_x(view_camera[0]), 0.7)	);
layer_x(distant,	lerp(0, camera_get_view_x(view_camera[0]), 0.85));
layer_x(farAway,	lerp(0, camera_get_view_x(view_camera[0]), 0.9)	);

layer_x(distant2,	lerp(0, camera_get_view_x(view_camera[0]), 0.85));//c02
layer_x(distant3,	lerp(0, camera_get_view_x(view_camera[0]), 0.85));//c02

layer_x(distant4,	lerp(0, camera_get_view_x(view_camera[0]), 0.85)); //c03d
layer_x(distant5,	lerp(0, camera_get_view_x(view_camera[0]), 0.85)); //c03

