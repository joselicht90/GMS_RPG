//update sprite
function PlayerAnimateSprite()
{
	

	//get the total frames of each direction sprite in teh strip
	//in our running sprite strip we have 32 frames and each direction
	//has 8 frames
	var _totalFrames = sprite_get_number(sprite_index) / 4;

	//our index will be our local frame (0 to 7) plus our direction
	//(0,1,2,3 --> right, up, left, down) multiplied by total frames
	//of each direction (8)
	image_index = localFrame + (CARDINAL_DIR * _totalFrames);

	//this way we increment our image_index (the frame of the animation)
	//with code and dependant of our game frame rate and note the animation
	//declared frame rate.
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

	//if animation loop on next step
	if(localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	}
	else animationEnd = false;
}











