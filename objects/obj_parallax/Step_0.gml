var near = layer_get_id("background_near");
var stillNear = layer_get_id("background_stillnear");
var distant = layer_get_id("background_distant");
var farAway = layer_get_id("background_FarAway");

layer_x(near,	lerp(0, camera_get_view_x(view_camera[0]), 0.5)	);
layer_x(stillNear,	lerp(0, camera_get_view_x(view_camera[0]), 0.7)	);
layer_x(distant,	lerp(0, camera_get_view_x(view_camera[0]), 0.85));
layer_x(farAway,	lerp(0, camera_get_view_x(view_camera[0]), 0.9)	);