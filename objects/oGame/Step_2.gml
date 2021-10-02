/// @description Pause game
// You can write your code in this editor

if(keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start))
{
	global.gamePause = !global.gamePause;
	
	if(global.gamePause)
	{
		with(all)
		{
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
	}
	else
	{
		with(all)
		{
			image_speed = gamePausedImageSpeed;
		}
	}
}