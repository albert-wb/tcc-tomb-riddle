var near = layer_get_id("Background_Near");
var stillNear = layer_get_id("Background Stillnear");
var distant = layer_get_id("Background_Distant");
var farAway = layer_get_id("Background_FarAway");

layer_x(near,	lerp(0, camera_get_view_x(view_camera[0]), 0.5)	);
layer_x(stillNear,	lerp(0, camera_get_view_x(view_camera[0]), 0.7)	);
layer_x(distant,	lerp(0, camera_get_view_x(view_camera[0]), 0.85)	);
layer_x(farAway,	lerp(0, camera_get_view_x(view_camera[0]), 0.9)	);