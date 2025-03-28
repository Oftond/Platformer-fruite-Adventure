function pause()
{
	global.IsPause = true;
	
	with (all)
	{
		alarm_time = alarm_get(0);

		paused_speed = speed;

		paused_animation = image_speed;
		
		paused_gravity = gravity;

		speed = 0;

		image_speed = 0;
		
		gravity = 0;
	}
	
	paused_backgroundSpeed = layer_get_vspeed("Background");
	layer_vspeed("Background", 0);
}

function unpause()
{
	global.IsPause = false;
	
	with (all)
	{
		alarm_time = -1;
		
		speed = paused_speed;
	
		image_speed = paused_animation;
		
		gravity = paused_gravity;
	}
	
	layer_vspeed("Background", paused_backgroundSpeed);
}