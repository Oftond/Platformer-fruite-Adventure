camera_width = global.CameraWidth;
camera_height = global.CameraHeight;

follow = obj_player;

finale_cam_x = 0;
finale_cam_y = 0;
cam_spd = 0.05;

if (instance_number(obj_camera) > 1)
	instance_destroy(self);